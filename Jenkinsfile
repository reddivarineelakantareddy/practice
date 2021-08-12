pipeline {
    agent any

    stages {
        stage('gitcheckout') {
            steps {
               checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/reddivarineelakantareddy/practice.git']]]) 
                sh 'ls'
                
            }
        }
         /* stage('mvn build') {
              steps {
                sh ' mvn clean install'
            }
        }*/
        stage('docker build') {
              steps {
                sh ' docker build -t ow1:v1 . '
                 
            }
            
    }
}
}
