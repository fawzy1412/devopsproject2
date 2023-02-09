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
               sh """sh 'docker images|grep -i demo| awk \'{print $1":"$2}\'| xargs docker rmi -f'"""
               sh 'docker build -t demo2:$BUILD_NUMBER .'
            }
        }


         stage('tag docker image') {
            steps {
               sh 'docker image tag demo2:$BUILD_NUMBER fawzy14/demo2:$BUILD_NUMBER '
               sh 'docker image tag demo2:$BUILD_NUMBER fawzy14/demo2:latest '
            }
        }








        stage('copy files to web server') {
            steps {
               sshagent(['virginia-key']) {
                      sh 'ssh -o StrictHostKeyChecking=no ubuntu@172.31.16.47'
                }



            }
        }


        















    }
}
