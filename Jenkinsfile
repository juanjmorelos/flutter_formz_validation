pipeline{
    agent any
    environment {
        FLUTTER = "/Users/juanmorelos/development/flutter/bin/flutter"
    }
    stages{
        stage('Flutter Pub Get') {
            steps {
                // Instala las dependencias de Flutter
                sh '${FLUTTER} pub get --no-example'
            }
        }
        stage('Build Web') {
            steps {
                // Construye la aplicación web de Flutter
                sh '${FLUTTER} build web'
            }
        }
        stage('deploy') {
            steps {
                // Construye la aplicación web de Flutter
                sh 'firebase deploy'
            }
        }
    }
}