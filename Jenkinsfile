pipeline {
    agent any

    stages {
        stage('Welcome') {
            steps {
                echo "Build Number: ${env.BUILD_NUMBER}"
                echo "Chalo, kaam shuru karte hain!"
            }
        }
        stage('Check Files') {
            steps {
                sh 'ls -l'
            }
        }
        stage('Docker Check') {
            steps {
                sh 'docker --version'
            }
        }
    }

    post {
        always {
            echo 'Main har haal mein chalunga (Always)!'
        }
        success {
            echo 'Mubarak ho! Pipeline pass ho gayi.'
        }
        failure {
            echo 'Afsoos! Kuch toh gadbad hai.'
        }
    }
}
