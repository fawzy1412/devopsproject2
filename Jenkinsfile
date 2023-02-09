pipeline {
    agent any

    stages {
        stage('SCM checkout') {
            steps {
               git 'https://github.com/fawzy1412/devopsproject2.git'
            }
        }

        stage('build docker image') {
            steps {
               sh 'docker build -t demo2:$BUILD_NUMBER .'
            }
        }


         stage('tag docker image') {
            steps {
               sh 'docker image tag demo2:$BUILD_NUMBER fawzy14/demo2:$BUILD_NUMBER '
               sh 'docker image tag demo2:$BUILD_NUMBER fawzy14/demo2:latest '
               
            }
        }

        stage('push docker image') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub_passwd', variable: 'dockerhub_passwd')]) {
                    sh 'docker login -u fawzy14 -p ${dockerhub_passwd} '
                    sh 'docker image push fawzy14/demo2:$BUILD_NUMBER '
                    sh 'docker image push  fawzy14/demo2:latest '
                    sh 'docker rmi -f demo2:$BUILD_NUMBER  fawzy14/demo2:latest '
                }




               
            }
        }








        stage('run container at web server') {
            steps {
               sshagent(['virginia-key']) {
                      
                      //sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.16.47 docker stop $(docker ps -aq)'
                      sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.16.47  docker rm -f $(docker ps -aq)'
                       sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.16.47 docker rmi -f fawzy14/demo2:latest'
                      sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.16.47 docker run -d  --name demo2$BUILD_NUMBER -p 8080:80 fawzy14/demo2:latest '
                }



            }
        }


        















    }
}
