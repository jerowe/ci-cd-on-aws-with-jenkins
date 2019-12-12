pipeline {
    agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker-compose build'
            }
        }
        stage('Test'){
            steps {
                sh 'docker-compose up -d; sleep 100; docker-compose ps -q flask-app-server'
            }
        }
        stage('Deploy') {
            steps {
                sh 'make publish'
            }
        }
    }
}