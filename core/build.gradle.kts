plugins {
    id("com.android.library")
    id("kotlin-android")
    id("org.jetbrains.kotlin.plugin.serialization")
}

android {
    namespace = "extensions.core"
    compileSdk = 34

    defaultConfig {
        minSdk = 21
    }

    sourceSets {
        named("main") {
            manifest.srcFile("AndroidManifest.xml")
            java.srcDirs("src/main/kotlin")
            res.srcDirs("src/main/res")
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = "1.8"
    }
}

dependencies {
    val libs = versionCatalogs.named("libs")
    compileOnly(libs.findBundle("provided").get())
    implementation(libs.findBundle("common").get())
}