pipeline {
    agent any
    stages {
        stage('build & SonarQube analysis') { 
            steps {
                withSonarQubeEnv('sonarqube') {  
                sh 'mvn clean sonar:sonar'
             }
            }
           }

        stage('SLEEP') { 
            steps {
                sh 'sleep 25'
             }
            }

        stage("Quality Gate") {
            steps {
              timeout(time: 5, unit: 'MINUTES') {
                waitForQualityGate abortPipeline: true
              }
            }
        }
        stage('Building Artifact with Maven') {
        
            steps {
                echo 'Building package with Maven'
                sh 'mvn clean install package'
            }
        }
       
        }
    }
