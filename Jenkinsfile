pipeline {
    agent any

    stages {
        stage('Build & Test') {
            steps {
                sh '''
                    echo "=== DEBUGGING - JenkinsFile ==="
                    echo "Current directory: $(pwd)"
                    echo "Files in current directory:"
                    ls -la

                    echo "WORKSPACE = $WORKSPACE"
                    docker-compose run --rm -v $WORKSPACE:/app test-runner

                    # Run build + test with docker-compose
                    # docker-compose down --volumes --remove-orphans || true
                    # docker-compose up --build --exit-code-from test-runner
                '''
            }
        }
    }

    post {
        always {
            sh 'docker-compose down --volumes --remove-orphans || true'
        }
    }
}
