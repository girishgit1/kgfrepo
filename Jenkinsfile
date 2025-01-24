pipeline {
    agent any
    
    environment {
        // Define your environment variables here
        GIT_REPO = 'https://github.com/girishgit1/kgfrepo.git'  // Git repository URL
        IMAGE_NAME = 'gera'  // Docker image name
        BUILD_ID = 'latest'
        DOCKER_HUB_USERNAME = 'dockerqwert123'  // Docker registry URL
        DOCKER_CREDENTIALS_ID = 'docker'  // Jenkins credentials ID for Docker login
        PORT = '3636'  // Port to expose for your container
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull the code from Git repository
                git "${env.GIT_REPO}"
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
        
        stage('Deploy') {
            steps {
                // Deploy the image (e.g., Docker run)
                script {
                    sh "docker run -d -p ${env.PORT}:${env.PORT} ${env.IMAGE_NAME}:${env.BUILD_ID}"
                }
            }
        }
    }
}
