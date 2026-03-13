pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'Docker-credentials'
        IMAGE_NAME = 'shilpakevala/hello-jenkins'
    }

    stages {

        stage('Clone Repository') {
            steps {
                git 'https://github.com/shilpakevala08/Dcoker_push.git'
            }
        }

        stage('Build Application') {
            steps {
                sh 'javac HelloWorld.java'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}:latest")
                }
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'Docker-credentials',
                usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                sh "docker push ${IMAGE_NAME}:latest"
            }
        }
    }
}
