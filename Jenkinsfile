pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "srushti6806/app-image1"
        TAG = "v2"
    }

    stages {
        stage('Clone Code') {
            steps {
                // Fixed: Removed the double 'git' keyword
                git branch: 'main', url: 'https://github.com/Srushti-hidakal/docker.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                // Fixed: Changed 'sh' to 'bat' and used Windows variable syntax
                bat "docker build -t %DOCKER_IMAGE%:%TAG% ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds',
                usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    // Fixed: Changed 'sh' to 'bat'
                    bat "echo %PASSWORD%| docker login -u %USERNAME% --password-stdin"
                }
            }
        }

        stage('Push Image') {
    steps {
        retry(3) {
            bat 'docker push %DOCKER_IMAGE%:%TAG%'
        }
    }
}
    }
}
