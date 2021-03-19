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
        
        stage('newman') {
            steps {
                sh 'newman run Restful_Booker.postman_collection.json --environment Restful_Booker.postman_environment.json --reporters junit'
            }
            post {
                always {
                        junit '**/*xml'
                    }
                }
        }
    }
}
