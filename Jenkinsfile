pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/xeolera/fooproject.git'
            }
        }
        stage('Build') {
            steps {
                bat "mvn test"
            }
            post {
                always {
                    junit '**/TEST*.xml'
                }
            }
        }
    }
}