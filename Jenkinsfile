pipeline {
    agent any

    stages {
        stage('Build & Test') {
            steps {
                dir('/projects') {
                    sh '''
                        echo "=== DEBUGGING - JenkinsFile ==="
                        echo "Current directory: $(pwd)"
                        echo "Files in current directory:"
                        ls -la

                        # Run build + test with docker-compose
                        docker-compose down --volumes --remove-orphans || true
                        docker-compose up --build --exit-code-from test-runner
                    '''
                }
            }
        }
    }

    post {
        always {
            sh 'docker-compose down --volumes --remove-orphans || true'
        }
    }
}
