pipeline {
    agent any

    stages {
        stage('Build & Test') {
            steps {
                sh 'docker-compose up --build --force-recreate --remove-orphans --exit-code-from test-runner'
            }
        }
    }
}
