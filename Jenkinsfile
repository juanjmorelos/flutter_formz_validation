pipeline{
    agent any
    environment {
        FLUTTER_HOME = '/opt/flutter' // Ruta al SDK de Flutter en el agente
        PATH = "${FLUTTER_HOME}/bin:${env.PATH}"
    }
    stages{
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