node{
    stage('Clone') {
        git 'https://github.com/Lstar974/wordpress.git'
    }
    stage('Ansible') {
      ansiblePlaybook (
          colorized: true, 
          become: true,             
          playbook: 'playbook.yml',
          inventory: 'hosts.yml'
      )
    }
}
