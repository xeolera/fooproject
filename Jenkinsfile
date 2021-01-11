pipeline {
  agent anystages {
  stage('Build') {
     steps {
      sh "mvn compile"
     }
  }  stage('Test') {
     steps {
      sh "mvn test"
     }
     post {
      always {
        junit '**/TEST*.xml'
      }
     }
  }
 }
}
