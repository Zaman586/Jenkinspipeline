pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t zaman-anwar-cv .'
                }
            }
        }

        stage('Scan') {
            steps {
                script {
                    // Scan the Docker image for vulnerabilities using Trivy
                    sh 'trivy image --exit-code 1 --severity HIGH,CRITICAL zaman-anwar-cv'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy the container (example using Docker run)
                    sh 'docker run -d -p 80:80 --name cv zaman-anwar-cv'
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
