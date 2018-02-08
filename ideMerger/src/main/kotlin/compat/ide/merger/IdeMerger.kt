@file:JvmName("IdeMerger")

package compat.ide.merger

import com.jetbrains.plugin.structure.base.utils.closeLogged
import com.jetbrains.plugin.structure.classes.resolvers.Resolver
import com.jetbrains.plugin.structure.classes.resolvers.UnionResolver
import com.jetbrains.plugin.structure.ide.Ide
import com.jetbrains.plugin.structure.ide.IdeManager
import com.jetbrains.plugin.structure.ide.classes.IdeResolverCreator
import com.jetbrains.plugin.structure.intellij.classes.locator.CompileServerExtensionKey
import com.jetbrains.plugin.structure.intellij.classes.plugin.IdePluginClassesFinder
import com.jetbrains.plugin.structure.intellij.classes.plugin.IdePluginClassesLocations
import com.jetbrains.plugin.structure.intellij.plugin.IdePlugin
import org.gradle.api.logging.Logging
import org.jetbrains.kotlin.tools.kompat.ssg.SSGClassReadVisitor
import org.jetbrains.kotlin.tools.kompat.ssg.SupersetGenerator
import org.jetbrains.kotlin.tools.kompat.ssg.Visibility
import org.jetbrains.kotlin.tools.kompat.ssg.visibility
import java.nio.file.Path
import java.nio.file.Paths
import kotlin.system.exitProcess

fun main(args: Array<String>) {
    val paths = args.map { Paths.get(it) }
    if (paths.size < 3) {
        System.err.println("Specify IDEs to merge and output: java IdeMerger <IDE #1> <IDE #2> ... <IDE #N> <output>")
        System.err.println("Example: java IdeMerger IU-173.4301 IU-181.2260 IU-super")
        exitProcess(1)
    }

    val idePaths = paths.dropLast(1)
    val outputPath = paths.last()

    val versionHandler = IdeMergedVersionHandler()
    val supersetGenerator = SupersetGenerator(Logging.getLogger("IdeMerger"), versionHandler)

    for (idePath in idePaths) {
        appendIde(supersetGenerator, idePath)
    }
    supersetGenerator.doOutput(outputPath.toFile())
}

private fun appendIde(supersetGenerator: SupersetGenerator, idePath: Path) {
    info("Reading classes of IDE $idePath")
    val ide = IdeManager.createManager().createIde(idePath.toFile())
    createIdeResolver(ide).use { ideResolver ->
        val ideMergedVersion = IdeMergedVersion(listOf(ide.version))
        info("Reading bundled plugins classes")
        val bundledPluginsClassesLocations = readBundledPluginsClassesLocations(ide)
        try {
            val pluginsResolvers = bundledPluginsClassesLocations
                    .map { it.getPluginClassesResolver() }
                    .let { UnionResolver.create(it) }
            appendIdeAndBundledPlugins(supersetGenerator, ideResolver, pluginsResolvers, ideMergedVersion)
        } finally {
            bundledPluginsClassesLocations.forEach { it.closeLogged() }
        }

    }
}

//replace with logger, if necessary.
private fun info(s: String) = println(s)

/**
 * Processes all the class files contained in the IDE and its bundled plugins
 * and merges them with the [supersetGenerator].
 */
private fun appendIdeAndBundledPlugins(supersetGenerator: SupersetGenerator,
                                       ideResolver: Resolver,
                                       pluginsResolver: Resolver,
                                       ideMergedVersion: IdeMergedVersion) {
    val unionResolver = UnionResolver.create(listOf(ideResolver, pluginsResolver))
    unionResolver.processAllClasses { classNode ->
        val visitor = SSGClassReadVisitor(ideMergedVersion)
        classNode.accept(visitor)
        val result = visitor.result
        if (!(result.isMemberClass && result.visibility == Visibility.PACKAGE_PRIVATE)) {
            supersetGenerator.appendClassNode(result)
        }
        true
    }
}

/**
 * Creates a [Resolver] for accessing class files of the [ide].
 */
private fun createIdeResolver(ide: Ide) = IdeResolverCreator.createIdeResolver(ide)

/**
 * Specifies which classes should be put into the plugin's class files resolver.
 * Currently, we select all the classes from:
 * 1) for `.jar`-red plugin, all classes contained in the `.jar`
 * 2) for directory-based plugins, all classes from the `/lib/` directory and
 * from the `/classes` directory, if any
 * 3) JPS-used classes, such as `Kotlin/lib/jps`.
 */
private val pluginClassesLocationsKeys = IdePluginClassesFinder.MAIN_CLASSES_KEYS + listOf(CompileServerExtensionKey)

/**
 * Merges all the classes by different locations (`/lib/`, `/classes/`, etc) into
 * one resolver.
 */
private fun IdePluginClassesLocations.getPluginClassesResolver(): Resolver =
        pluginClassesLocationsKeys.mapNotNull { getResolver(it) }.let { UnionResolver.create(it) }

/**
 * Finds class files of all plugins bundled into the [ide].
 *
 * The [IdePluginClassesLocations] must be [closed] [IdePluginClassesLocations.close]
 * when no more required to free up possibly occupied disk space:
 * plugins might have been extracted to a temporary directory.
 */
private fun readBundledPluginsClassesLocations(ide: Ide): List<IdePluginClassesLocations> =
        ide.bundledPlugins.mapNotNull { safeFindPluginClasses(ide, it) }

private fun safeFindPluginClasses(ide: Ide, idePlugin: IdePlugin) = try {
    info("Reading class files of a plugin $idePlugin bundled into $ide")
    IdePluginClassesFinder.findPluginClasses(idePlugin, pluginClassesLocationsKeys)
} catch (e: Exception) {
    info("Unable to read class files of a bundled plugin $idePlugin: ${e.message}")
    null
}

