pipeline {
    agent any

    stages {
        stage('build & SonarQube analysis') { 
            steps {
                echo 'Testing Source Code'
                withSonarQubeEnv('sonarqube') {  
                sh 'mvn clean sonar:sonar'
                sh 'sleep 10'
             }
            }
           }        
        stage("Quality Gate") {
            steps {
              timeout(time: 5, unit: 'MINUTES') {
                waitForQualityGate abortPipeline: true
              }
            }
        }
       
        }
    }
