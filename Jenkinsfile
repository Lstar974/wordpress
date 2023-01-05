node {   
    stage('Clone repository') {
        git branch: 'main', credentialsId: 'config', url: 'https://github.com/Lstar974/wordpress.git'
    }
    
    stage('Build image') {
       dockerImage = docker.build("lstar974/wordpress")
    }
    
    stage('Push image') {
        withDockerRegistry(credentialsId: 'de97d028-f5ff-4ed3-af2c-2e7efff3453c') {
        dockerImage.push()
        }
      stage('Ansible') {
      ansiblePlaybook credentialsId: 'Ansible', disableHostKeyChecking: true, inventory: 'hosts.yml', playbook: 'playbook.yml'
      withDockerRegistry(credentialsId: '7d344612-5b60-433e-8760-70fb00d4347e', url: 'https://hub.docker.com/repository/docker/lstar974/wordpress') {
      sh 'ansible-playbook -i hosts.yml playbook.yml'
        }
      }
    }    
}
