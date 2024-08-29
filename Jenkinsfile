pipeline{
    agent any
    environment {
        FLUTTER = "/Users/juanmorelos/development/flutter/bin/flutter"
    }
    stages{
        stage('Install flutter') {
            steps {
                // Instala las dependencias de Flutter
                sh 'curl https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.7.3-stable.tar.xz -o /foo/bar/flutter.tar.xz'
                sh 'apt-get install xz-utils'
                sh 'tar xf /foo/bar/flutter.tar.xz'
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