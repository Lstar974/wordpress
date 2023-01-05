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
      ansiblePlaybook credentialsId: '85b065af-1f14-44d3-8492-22aa367b54b6', disableHostKeyChecking: true, inventory: 'hosts.yml', playbook: 'playbook.yml'
      withDockerRegistry(credentialsId: 'de97d028-f5ff-4ed3-af2c-2e7efff3453c') {
        }
      }
        stage('Test image') {
        docker.image('lstar974/wordpress').withRun('-p 80:80') { c ->
        sh 'docker ps'
        sh 'curl localhost'
	     }
    }

    }    
}
