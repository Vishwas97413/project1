pipeline {
    agent any

    stages {

        stage('Checkout Source Code') {
            steps {
                echo 'Checking out source code from GitHub...'
                checkout scm
            }
        }

        stage('Verify Workspace') {
            steps {
                sh '''
                echo "Current Directory:"
                pwd

                echo "Repository Contents:"
                ls -la
                '''
            }
        }

        stage('Verify Docker') {
            steps {
                sh '''
                docker --version
                '''
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
