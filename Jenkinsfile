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
                sh 'sleep 5'
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
                 sh "docker build -t alro1001/jenkinssonarmvndocker_1:${env.BUILD_ID} ."
              }
            }
            stage('Pushing Image to DockerHub') {
        
            steps {
                 sh 'sudo docker login -u alro1001 -p **********'
                 sh "sudo docker push alro1001/jenkinssonarmvndocker_1:${env.BUILD_ID}"
              }
            }
            stage('Deploying Image to Tomcat Server') {
        
            steps {
                 sh 'docker stop tomcatcontainer || true'
                 sh 'docker rm tomcatcontainer || true'
                 sh "docker rmi alro1001/jenkinssonarmvndocker_1:${env.BUILD_ID} || true"
                 sh "docker run -itd --name tomcatcontainer -p 8888:8080 alro1001/jenkinssonarmvndocker_1:${env.BUILD_ID}"
              }
            }
       
        }
    }
