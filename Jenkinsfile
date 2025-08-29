pipeline {
    agent any

    stages {
        stage('Build & Test') {
            steps {
                sh 'docker-compose up --build --force-recreate --renew-anon-volumes --remove-orphans --exit-code-from test-runner'
            }
        }
    }
}
