pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh "mvn compile"
            }
        }
        stage('Test') {
            steps {
                sh "mvn test"
            }
            post {
                always {
                    junit '**/TEST*.xml'
                }
            }
            
        stage('newman') {
            steps {
                sh 'newman run Restful Booker.postman_collection.json --environment Restful Booker.postman_environment.json --reporters junit'
            }
            post {
                always {
                        junit '**/*xml'
                    }
                }
            }
        }
    }
}
