pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                echo 'Building the Docker Image...'
                // Build the Docker image from the Dockerfile
                script {
                    docker.build('zaman-anwar-cv')
                }
            }
        }

        stage('Test') {
            steps {
                echo 'Running Security Scans...'
                // Example: Use a security scanner like Trivy or Docker Bench
                // You can replace this with the actual security scan command you need
                sh 'docker run --rm aquasec/trivy image zaman-anwar-cv'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the Docker Image...'
                // Push the Docker image to DockerHub or a private registry
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'docker-credentials-id') {
                        docker.image('zaman-anwar-cv').push('latest')
                    }
                }
            }
        }
    }

    post {
        always {
            echo 'This will always run after each stage'
        }
        success {
            echo 'The pipeline has been successfully completed!'
        }
        failure {
            echo 'The pipeline failed.'
        }
    }
}
