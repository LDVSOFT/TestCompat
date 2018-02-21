package org.jetbrains.kotlin.tools.kompot.ssg

import org.jetbrains.kotlin.tools.kompot.api.tool.Version
import org.jetbrains.kotlin.tools.kompot.commons.*
import org.objectweb.asm.AnnotationVisitor
import org.objectweb.asm.ClassVisitor
import org.objectweb.asm.MethodVisitor
import org.objectweb.asm.Opcodes
import org.objectweb.asm.Opcodes.ACC_ABSTRACT

class SSGClassWriter(val withBodyStubs: Boolean = true) {

    fun SSGVersionContainer.writeVersion(getVisitor: (String, Boolean) -> AnnotationVisitor?) {
        val version = version ?: return
        getVisitor(existsInDesc, true)?.apply {
            visit("version", version.asLiteralValue())
            visitEnd()
        }
    }

    private fun writeAltAnnotation(
        arrayName: String,
        enumDesc: String,
        annDesc: String,
        getVisitor: (String, Boolean) -> AnnotationVisitor?,
        enumValues: List<Enum<*>>,
        versions: List<Version?>
    ) {
        getVisitor(annDesc, true)?.apply {
            visitArray("version")?.apply {
                versions.forEach { visit(null, it!!.asLiteralValue()) }
                visitEnd()
            }
            visitArray(arrayName)?.apply {
                for (value in enumValues) {
                    visitEnum(arrayName, enumDesc, value.name)
                }
                visitEnd()
            }
            visitEnd()
        }
    }

    private fun SSGAlternativeVisibilityContainer.writeAlternativeVisibility(getVisitor: (String, Boolean) -> AnnotationVisitor?) {
        val alternativeVisibility = alternativeVisibilityState ?: return
        val (visibilities, versions) = alternativeVisibility.toList().filter { it.second != null }.unzip()
        writeAltAnnotation("visibility", visEnumDesc, altVisDesc, getVisitor, visibilities, versions)
    }

    private fun SSGAlternativeModalityContainer.writeAlternativeModality(getVisitor: (String, Boolean) -> AnnotationVisitor?) {
        val alternativeModality = alternativeModalityState ?: return
        val (modalities, versions) = alternativeModality.toList().filter { it.second != null }.unzip()
        writeAltAnnotation("modality", modEnumDesc, altModDesc, getVisitor, modalities, versions)
    }

    private fun SSGNullabilityContainer.writeNullability(getVisitor: (String, Boolean) -> AnnotationVisitor?) {
        val nullability = nullability
        val desc = when(nullability) {
            Nullability.NOT_NULL -> notNullDesc
            Nullability.NULLABLE -> nullableDesc
            else -> return
        }
        getVisitor(desc, true)?.apply {
            visitEnd()
        }
    }

    private fun ClassVisitor.writeOuterClassInfo(info: OuterClassInfo?) {
        if (info == null) return
        visitOuterClass(info.owner, info.methodName, info.methodDesc)
    }

    private fun MethodVisitor.writeStubBody() {
        visitCode()
        val desc = "java/lang/UnsupportedOperationException"
        visitTypeInsn(Opcodes.NEW, desc)
        visitInsn(Opcodes.DUP)
        visitLdcInsn("Superset stub body should never be called!")
        visitMethodInsn(Opcodes.INVOKESPECIAL, desc, "<init>", "(Ljava/lang/String;)V", false)
        visitInsn(Opcodes.ATHROW)
    }


    var kotlinClasses = 0

    fun write(node: SSGClass, classWriter: ClassVisitor) {

        classWriter.visit(Opcodes.V1_8, node.access, node.fqName, node.signature, node.superType, node.interfaces)

        if (node.isKotlin) {
            kotlinClasses++
        }

        classWriter.writeOuterClassInfo(node.ownerInfo)
        node.writeAnnotations(classWriter::visitAnnotation)
        node.innerClassesBySignature?.values?.forEach { ref ->
            classWriter.visitInnerClass(ref.name, ref.outerName, ref.innerName, ref.access)
        }

        node.writeVersion(classWriter::visitAnnotation)
        node.writeAlternativeVisibility(classWriter::visitAnnotation)
        node.writeAlternativeModality(classWriter::visitAnnotation)

        node.fieldsBySignature.values.forEach {
            classWriter.visitField(it.access, it.name, it.desc, it.signature, it.value)?.apply {
                it.writeVersion(::visitAnnotation)
                it.writeAlternativeVisibility(::visitAnnotation)
                it.writeNullability(::visitAnnotation)
                it.writeAnnotations(::visitAnnotation)

                visitEnd()
            }
        }

        node.methodsBySignature.values.forEach {
            classWriter.visitMethod(it.access, it.name, it.desc, it.signature, it.exceptions)?.apply {
                it.writeVersion(::visitAnnotation)
                it.writeAlternativeVisibility(::visitAnnotation)
                it.writeAlternativeModality(::visitAnnotation)
                it.writeNullability(::visitAnnotation)
                it.writeAnnotations(::visitAnnotation)

                it.annotationDefaultValue?.accept(visitAnnotationDefault())

                if (it.access noFlag ACC_ABSTRACT) {
                    if (withBodyStubs) {
                        writeStubBody()
                    }
                }
                visitMaxs(-1, -1)
                visitEnd()
            }
        }

        node.innerClassesBySignature?.let {
            it.values.forEach {
                classWriter.visitInnerClass(it.name, it.outerName, it.innerName, it.access)
            }
        }

        classWriter.visitEnd()
    }

    private fun SSGAnnotated.writeAnnotations(
        getVisitor: (String, Boolean) -> AnnotationVisitor?
    ) {
        annotations?.forEach {
            it.accept(getVisitor(it.desc, true))
        }
    }
}