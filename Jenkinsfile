pipeline {
    agent any

    stages {
        stage('Build & Test') {
            steps {
                // Debug: Let's see what's happening
                sh '''
                    echo "=== DEBUGGING ==="
                    echo "Current directory: $(pwd)"
                    echo "WORKSPACE: ${WORKSPACE}"
                    echo "Files in current directory:"
                    ls -la
                    echo ""
                    echo "Files in WORKSPACE:"
                    ls -la ${WORKSPACE}
                    echo ""
                    echo "=== END DEBUGGING ==="
                '''

                // Clean up old containers, networks, volumes
                sh '''
                    docker-compose down --volumes --remove-orphans || true
                '''

                // Run build + test from the workspace directory
                sh '''
                    cd ${WORKSPACE} && echo "Now in: $(pwd)" && ls -la
                    WORKSPACE=${WORKSPACE} docker-compose up --build --exit-code-from test-runner
                '''
            }
        }
    }
}
