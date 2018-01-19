package compat.process.ssg

import org.objectweb.asm.util.TraceClassVisitor
import java.io.ByteArrayOutputStream
import java.io.PrintWriter

fun SSGClass.asmText(): String {
    val writer = SSGClassWriter()
    val baos = ByteArrayOutputStream()
    val cv = TraceClassVisitor(PrintWriter(baos))
    writer.write(this, cv)
    return baos.toString("UTF-8")
}

infix fun Int.hasFlag(i: Int) = this and i != 0
infix fun Int.noFlag(i: Int) = this and i == 0