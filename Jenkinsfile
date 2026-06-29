pipeline {

    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Python Syntax Check') {
            steps {
                sh '''
                docker run --rm \
                  -v "$WORKSPACE":/workspace \
                  -w /workspace/app \
                  python:3.12 \
                  python -m py_compile app.py
                '''
            }
        }

        stage('Verify Docker') {
            steps {
                sh 'docker --version'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }

        failure {
            echo 'Pipeline failed.'
        }
    }
}
