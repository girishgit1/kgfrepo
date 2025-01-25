pipeline {
    agent any

    environment {
        // Define your environment variables here
        IMAGE_NAME = 'gera'  // Docker image name
        BUILD_ID = 'latest'
        DOCKER_HUB_USERNAME = 'dockerqwert123'  // Docker registry URL
        DOCKER_CREDENTIALS_ID = 'docker'  // Jenkins credentials ID for Docker login
        PORT = '3636'  // Port to expose for your container
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} ."
                }
            }
        }
        
        stage('Push') {
            steps {
                // Push Docker image to Docker Hub (or another registry)
                script {
                    docker.withRegistry("${env.REGISTRY}", "${env.DOCKER_CREDENTIALS_ID}") {
                        docker.image("${env.IMAGE_NAME}:${env.BUILD_ID}").push()
                    }
                }
            }
        }
        
    }
}
