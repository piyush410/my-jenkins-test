pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/piyush410/my-jenkins-test.git'
            }
        }
        stage('Check Files') {
            steps {
                sh 'ls -l'
                sh 'cat README.md'
            }
        }
        stage('Finished') {
            steps {
                echo 'Pipeline successfully executed from GitHub!'
            }
        }
    }
}
