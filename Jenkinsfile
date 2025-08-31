pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // This pulls your repo into Jenkins workspace
                checkout scm
            }
        }
        
        stage('Build & Test') {
            steps {
                // Debug: Let's see what's happening
                sh '''
                    echo "=== DEBUGGING - JenkinsFile ==="
                    echo "Current directory: $(pwd)"
                    echo "WORKSPACE: ${WORKSPACE}"
                    echo "Files in current directory:"
                    ls -la
                    echo ""
                    echo "Files in WORKSPACE:"
                    ls -la ${WORKSPACE}
                    echo ""
                    echo "=== END DEBUGGING - Jenkinsfile ==="
                '''

                // Run build + test
                sh '''
                    cd ${WORKSPACE}
                    docker-compose down --volumes --remove-orphans || true
                    docker-compose up --build --exit-code-from test-runner
                '''

            }
        }
    }
}
