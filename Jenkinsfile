pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                sh 'test -f target/classes/App.class'
                echo 'Application build check passed'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t jenkins-cicd-task2 .'
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    docker rm -f jenkins-cicd-task2-app || true
                    docker run -d --name jenkins-cicd-task2-app jenkins-cicd-task2
                '''
            }
        }
    }
}
