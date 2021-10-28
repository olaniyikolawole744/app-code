pipeline {
    agent any

    environment {
        ANSIBLE_VAULT_PASSWORD_FILE = credentials ('DOCKERHUBKEY')
        ANSIBLE_HOSTS="ansible-jobs/inventory/ec2.py"
        EC2_INI_PATH="ansible-jobs/inventory/ec2.ini"
        FILE = 'secret.txt'
        
    }

    stages {
        
        stage('BUILD INFRASTRUCTURE') {
            steps { 
                 sh 'sh scripts/infrastructure.sh'
           }
        } 

        stage('CREATE DEV APP') {
             when {
                branch "develop"
            }
            steps {
                sh 'sh playdev.sh'      
                }
        }  

        stage('CREATE PROD APP') {
             when {
                branch "main"
            }
            steps {
                sh "echo '${VAULT_CREDS_PSW}' > secret.txt"
                sh 'sh scripts/playbook.sh'      
            }
        } 

        
    }
}





