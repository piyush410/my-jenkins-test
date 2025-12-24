pipeline {
    agent any
    
    environment {
        // Yahan apna Docker Hub username likhein
        DOCKER_HUB_USER = 'apna-username-yahan-likho'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/piyush410/my-jenkins-test.git'
            }
        }

        stage('Build & Tag') {
            steps {
                // Image ka naam aapke username ke saath hona chahiye
                sh "docker build -t ${DOCKER_HUB_USER}/my-web-app:latest ."
            }
        }

        stage('Login & Push') {
            steps {
                // Jenkins ke credentials use karke login aur push karein
                withCredentials([usernamePassword(credentialsId: 'docker-hub-login', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh "echo ${PASS} | docker login -u ${USER} --password-stdin"
                    sh "docker push ${DOCKER_HUB_USER}/my-web-app:latest"
                }
            }
        }

        stage('Run Locally') {
            steps {
                sh 'docker rm -f piyush-container || true'
                sh "docker run -d --name piyush-container -p 8888:80 ${DOCKER_HUB_USER}/my-web-app:latest"
            }
        }
    }
}
