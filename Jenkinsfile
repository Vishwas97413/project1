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
        stage('Build Docker Image') {
            steps {
                  sh '''
                  docker build -t flask-ecommerce:${BUILD_NUMBER} ./app
                  docker tag flask-ecommerce:${BUILD_NUMBER} flask-ecommerce:latest
                  '''
                  }
           }
         stage('Docker Login') {
              steps {
                   withCredentials([usernamePassword(
                   credentialsId: 'dockerhub',
                   usernameVariable: 'DOCKER_USER',
                   passwordVariable: 'DOCKER_PASS'
                   )]) {
                   sh '''
                   echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                   '''
                       }
                   }
          }
       stage('Push Docker Image') {
                                 steps {
                                       sh '''
                                       docker tag flask-ecommerce:${BUILD_NUMBER} vishwasgm29/flask-ecommerce:${BUILD_NUMBER}
                                       docker tag flask-ecommerce:${BUILD_NUMBER} vishwasgm29/flask-ecommerce:latest

                                       docker push vishwasgm29/flask-ecommerce:${BUILD_NUMBER}
                                       docker push vishwasgm29/flask-ecommerce:latest
                                       '''
                                       }
           }
        stage('List Docker Images') {
            steps {
                  sh '''
                  docker images | grep flask-ecommerce
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
