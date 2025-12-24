pipeline {
    agent any
    
    environment {
        // Yahan apna Docker Hub username likhein
        DOCKER_HUB_USER = 'YOUR_DOCKERHUB_USERNAME'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/piyush410/my-jenkins-test.git'
            }
        }

        stage('Build Image') {
            steps {
                // Image build karna
                sh "docker build -t ${DOCKER_HUB_USER}/my-web-app:latest ."
            }
        }

        stage('Login & Push to Docker Hub') {
            steps {
                // Jenkins credentials ka use karke login aur push
                withCredentials([usernamePassword(credentialsId: 'docker-hub-login', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh "echo ${PASS} | docker login -u ${USER} --password-stdin"
                    sh "docker push ${DOCKER_HUB_USER}/my-web-app:latest"
                }
            }
        }

        stage('Deploy Locally') {
            steps {
                // Port 8888 par purana container hata kar naya chalana
                sh 'docker rm -f piyush-container || true'
                sh "docker run -d --name piyush-container -p 8888:80 ${DOCKER_HUB_USER}/my-web-app:latest"
                echo "Website is live at http://your-ip:8888"
            }
        }
    }
}
