node{

    stage('Clone') {
        git 'https://github.com/Lstar974/wordpress.git'
    }
    stage('Ansible') {
   
    sh 'ansible-playbook -i hosts.yml playbook.yml'
    }

}
