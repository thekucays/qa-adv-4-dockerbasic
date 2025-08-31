pipeline {
    agent any

    stages {
        stage('Build & Test') {
            steps {
                dir("${WORKSPACE}") {
                    sh """
                        echo "=== DEBUGGING - JenkinsFile ==="
                        echo "Current directory: \$(pwd)"
                        echo "WORKSPACE: ${WORKSPACE}"
                        echo "Files in current directory:"
                        ls -la 
                        echo "Files in WORKSPACE:"
                        ls -la ${WORKSPACE}
                        echo ""
                        echo "=== END DEBUGGING - Jenkinsfile ==="

                        # Run build + test with docker-compose
                        docker-compose down --volumes --remove-orphans || true
                        docker-compose up --build --exit-code-from test-runner
                    """
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
