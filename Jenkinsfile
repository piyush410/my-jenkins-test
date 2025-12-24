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
        // Purane container ko hatayein taaki naya wala 8888 par chal sake
        sh 'docker rm -f piyush-container || true'
        
        // Port mapping badal kar 8888:80 kar di
        sh 'docker run -d --name piyush-container -p 8888:80 my-web-app'
        
        echo 'Website ab port 8888 par chal rahi hai!'
            }
        }
    }
}
