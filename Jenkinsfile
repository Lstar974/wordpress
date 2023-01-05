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
      ansiblePlaybook credentialsId: 'ansible', disableHostKeyChecking: true, inventory: 'wordpress/hosts.yml', playbook: 'wordpress/playbook.yml'
      sh 'ansible-playbook -i hosts.yml playbook.yml'
        }
    }    
}
