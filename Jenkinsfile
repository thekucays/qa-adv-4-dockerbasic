pipeline {
    agent any

    stages {
        stage('Build & Test') {
            steps {
                // Clean up old containers, networks, volumes
                sh '''
                    docker-compose down --volumes --remove-orphans || true
                '''

                // Run build + test from the workspace directory
                sh '''
                    cd ${WORKSPACE}
                    docker-compose up --build --exit-code-from test-runner
                '''
            }
        }
    }
}
