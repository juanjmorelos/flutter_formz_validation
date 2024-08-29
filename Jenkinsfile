pipeline{
    agent any
    stages{
        stage('Flutter Pub Get') {
            steps {
                // Instala las dependencias de Flutter
                sh 'flutter doctor'
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