node {   
    stage('Clone repository') {
        git branch: 'main', credentialsId: 'config', url: 'https://github.com/Lstar974/wordpress.git'
    }
    
    stage('Build image') {
       dockerImage = docker.build("lucas/wordpress:latest")
    }
    
 stage('Push image') {
        withDockerRegistry(credentialsId: '7d344612-5b60-433e-8760-70fb00d4347e') {
        dockerImage.push()
        }
    }    
}
