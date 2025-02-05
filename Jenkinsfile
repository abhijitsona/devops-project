pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("my-website:${env.BUILD_ID}")
                }
            }
        }
        
        stage('Deploy') {
            steps {
                script {
                    // Stop and remove existing container
                    sh 'docker stop my-website-container || true'
                    sh 'docker rm my-website-container || true'
                    
                    // Run new container
                    docker.run(
                        "my-website:${env.BUILD_ID}",
                        "--name my-website-container -p 8080:80 -d"
                    )
                }
            }
        }
    }
    
    post {
        always {
            // Cleanup unused images
            sh 'docker system prune -f'
        }
    }
}
