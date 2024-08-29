pipeline{
    agent any
    environment {
        FLUTTER = "/Users/juanmorelos/development/flutter/bin/flutter"
    }
    stages{
        stage('Install flutter') {
            steps {
                // Instala las dependencias de Flutter
                sh 'sudo snap install flutter --classic'
            }
        }
        stage('Flutter Pub Get') {
            steps {
                // Instala las dependencias de Flutter
                sh 'flutter pub get --no-example'
            }
        }
        stage('Build Web') {
            steps {
                // Construye la aplicación web de Flutter
                sh 'flutter build web'
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