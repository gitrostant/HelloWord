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
                sh 'mvn clean install package'
            }
        }
        stage('Building Image with Docker') {
        
            steps {
                 sh "docker build -t gitrostant/stephanietest:${env.BUILD_ID} ."
              }
            }
            stage('Pushing Image to DockerHub') {
        
            steps {
                 sh 'docker login -u gitrostant -p 1002Alro!@'
                 sh "docker push gitrostant/stephanietest:${env.BUILD_ID}"
              }
            }
       
        }
    }
