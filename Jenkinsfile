pipeline {
    agent any

    stages {
        stage('Build & Test') {
            steps {
                sh 'docker compose up --build --exit-code-from test-runner'
            }
        }
    }
}
