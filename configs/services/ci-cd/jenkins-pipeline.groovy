pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                echo 'Building application'
                
            }
        }
        
        stage('Test') {
            steps {
                echo 'Testing application'
                
            }
        }
        
        stage('Deploy to Site 1') {
            steps {
                echo 'Deploying to Site 1'
                sh '''
                ssh -o StrictHostKeyChecking=no root@192.168.12.21 "docker pull 192.168.11.11:5000/app1:latest || true"
                ssh -o StrictHostKeyChecking=no root@192.168.12.21 "docker stop app1 || true"
                ssh -o StrictHostKeyChecking=no root@192.168.12.21 "docker rm app1 || true"
                ssh -o StrictHostKeyChecking=no root@192.168.12.21 "docker run -d --name app1 -p 80:80 192.168.11.11:5000/app1:latest"
                '''
            }
        }
        
        stage('Deploy to Site 2') {
            steps {
                echo 'Deploying to Site 2'
                sh '''
                ssh -o StrictHostKeyChecking=no root@192.168.22.21 "docker pull 192.168.11.11:5000/app1:latest || true"
                ssh -o StrictHostKeyChecking=no root@192.168.22.21 "docker stop app1 || true"
                ssh -o StrictHostKeyChecking=no root@192.168.22.21 "docker rm app1 || true" 
                ssh -o StrictHostKeyChecking=no root@192.168.22.21 "docker run -d --name app1 -p 80:80 192.168.11.11:5000/app1:latest"
                '''
            }
        }
    }
}