pipeline {
    agent any

    environment {
        // Define your environment variables here
        GIT_REPO = 'https://github.com/girishgit1/kgfrepo.git'  // Git repository URL
        IMAGE_NAME = 'gera'  // Docker image name
        BUILD_ID = 'latest'
        DOCKER_HUB_USERNAME = 'dockerqwert123'  // Docker registry URL
        DOCKER_CREDENTIALS_ID = 'docker'  // Jenkins credentials ID for Docker login
        GIT_CREDENTIALS_ID = 'Git'
        PORT = '3636'  // Port to expose for your container
    }

    stages {
        stage('Checkout') {
            steps {
                // Use credentials for Git repository
                git credentialsId: "${env.GIT_CREDENTIALS_ID}", url: "${env.GIT_REPO}"
            }
        }
        
        stage('Build') {
            steps {
                // Build Docker image
                script {
                    docker.build("${env.IMAGE_NAME}:${env.BUILD_ID}")
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
