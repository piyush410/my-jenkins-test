pipeline {
    agent any 

    stages {
        stage('Checkout') {
            steps {
                // Ye aapka purana step hai jo code lata hai
                git branch: 'main', url: 'https://github.com/piyush410/my-jenkins-test.git'
            }
        }
        
        stage('Check Files') {
            steps {
                // Ye bhi purana hai, list dekhne ke liye
                sh 'ls -l'
            }
        }

        stage('Docker Test') {
            steps {
                // Ye naya step hai Docker check karne ke liye
                echo 'Checking if Docker is ready...'
                sh 'docker version'
                sh 'docker run hello-world'
            }
        }
    }

    post {
        success {
            echo 'Sab kuch sahi chal raha hai!'
        }
        failure {
            echo 'Oops! Docker ya permissions mein kuch gadbad hai.'
        }
    }
}
