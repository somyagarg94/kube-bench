pipeline {
    agent none
    stages {
        stage('Build') {
            agent { dockerfile true }
            steps {
                echo 'Dockerfile built'
            }
        }
        
        stage('Scan') {
            agent {
                docker { image 'aquasec:scanner-cli:2.5' }
            }
        }
    }
}
