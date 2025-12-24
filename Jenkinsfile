pipeline {
    agent any
    
    environment {
        // Yahan apna Docker Hub username likhein
        DOCKER_HUB_USER = 'piyush410'
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
                withCredentials([usernamePassword(credentialsId: 'docker-hub-login', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    // Purani 'echo **** | docker login' wali line ko delete karke ye likhein
                    sh "docker login -u ${USER} -p ${PASS}"
                    
                    // Iske baad push wali command
                    sh "docker push ${USER}/my-web-app:latest"
                }
            }
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
