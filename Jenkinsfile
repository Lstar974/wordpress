node {   
    stage('Clone repository') {
        git branch: 'main', credentialsId: 'config', url: 'https://github.com/Lstar974/wordpress.git'
    }
    
    stage('Build image') {
       dockerImage = docker.build("lucas/wordpress:latest")
    }
    
 stage('Push image') {
        withDockerRegistry(credentialsId: 'de97d028-f5ff-4ed3-af2c-2e7efff3453c') {
        dockerImage.push()
        }
    }    
}
