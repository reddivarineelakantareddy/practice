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
                sh ' docker build -t ow1:v3 . '
               // sh "docker  tag ow1:v3 registry.hub.docker.com/${user}/ow1:v3"
                withCredentials([usernamePassword(credentialsId: 'Neelakanta.hub', passwordVariable: 'pw', usernameVariable: 'user')]) {
		 sh "docker  tag ow1:v3 registry.hub.docker.com/${user}/ow1:v3"
		sh "docker login -u ${user} -p ${pw} https://registry.hub.docker.com"
                sh "docker push registry.hub.docker.com/${user}/ow1:v3"               
             
				}
       stage('Deploy Application in k8s Cluster')
           kubernetesDeploy(
                configs: 'pod.yaml',
		kubeconfigId: 'kubernetes_configuration_kubeconfig',
		enableConfigSubstitution: true
	   ){
    }
}
        
}
}
