pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'dockerhub'  // Your Jenkins DockerHub credentials ID
        IMAGE_NAME = 'sneha2311/ise3'    // Docker Hub repo name
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/Snehap1104/ise_3.git'
            }
        }

        stage('Build and Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKERHUB_CREDENTIALS}") {
                        def app = docker.build("${IMAGE_NAME}:latest")
                        app.push()
                    }
                }
            }
        }
    }

    post {
        success {
            echo '✅ Docker image built and pushed successfully!'
        }
        failure {
            echo '❌ Build failed. Check logs.'
        }
    }
}