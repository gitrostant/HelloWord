pipeline {
    agent any

    stages {
        stage('build & SonarQube analysis') {
        
            steps {
                echo 'Testing Source Code'
                withSonarQubeEnv('sonarmvn') {
                sh 'mvn clean sonar:sonar'
              }
            }
        }
        
        stage("Quality Gate") {
            steps {
              timeout(time: 1, unit: 'HOURS') {
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

        stage('Building Image with Docker') {
        
            steps {
                echo 'Building Image with Docker'
                 sh 'docker build -t --name gitrostant/stephanietest:${env.BUILD_ID} .'
              }
            }
        }
    }
