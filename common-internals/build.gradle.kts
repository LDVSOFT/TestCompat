

dependencies {
    val compile by configurations
    compile("org.ow2.asm:asm-all:6.0_BETA")
    compile(project(":source-api"))
    compile("org.slf4j:slf4j-api:1.7.25")
}