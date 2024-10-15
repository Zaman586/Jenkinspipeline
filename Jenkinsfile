pipeline {
    agent any 

    environment {
        DOCKER_IMAGE = 'zamananwar/my-nginx-app:latest' // Docker image name
        REGISTRY_CREDENTIALS = 'docker-hub-credentials' // Jenkins credentials ID for Docker Hub
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Navigate to the correct directory
                    dir('/home/zamanpc/Jenkinspipeline') {
                        // Print the current directory to verify
                        sh 'pwd'
                        
                        // Check if Dockerfile exists in the current directory
                        sh 'ls -l'

                        // Build Docker image from the current directory
                        docker.build(DOCKER_IMAGE, '.')
                    }
                }
            }
        }

        stage('Scan') {
            steps {
                script {
                    // Run a Docker scan (optional, ensure Docker scan CLI is installed)
                    sh "docker scan ${DOCKER_IMAGE} || echo 'Docker scan not available, skipping...'"
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Login to Docker Hub and push the image
                    docker.withRegistry('https://index.docker.io/v1/', REGISTRY_CREDENTIALS) {
                        // Push the image to Docker Hub
                        sh "docker push ${DOCKER_IMAGE}"
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
