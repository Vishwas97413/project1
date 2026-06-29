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
                  echo "Workspace:"
                  pwd

                  echo "Repository:"
                  ls -R

                  docker run --rm \
                  -v "$WORKSPACE":/workspace \
                  python:3.12 \
                  ls -R /workspace
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
