pipeline {
    agent any 

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/piyush410/my-jenkins-test.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // 'my-web-app' naam ki image banayein
                sh 'docker build -t my-web-app .'
            }
        }

        stage('Run Container') {
            steps {
                // Purane container ko delete karein agar chal raha ho, phir naya chalayein
                sh 'docker rm -f piyush-container || true'
                sh 'docker run -d --name piyush-container -p 8081:80 my-web-app'
                echo 'Website is running on port 8081'
            }
        }
    }
}
