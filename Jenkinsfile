pipeline {
    agent any

    environment {
        ANSIBLE_VAULT_PASSWORD_FILE = credentials ('VAULT_ID')
        ANSIBLE_HOSTS="ansible-jobs/inventory/ec2.py"
        EC2_INI_PATH="ansible-jobs/inventory/ec2.ini"
    }

    stages {

        stage('CREATE VPC') {
            steps { 
                 sh 'sh scripts/VpcAutomationScript.sh'
           }
        }         

        stage('CREATE REMOTE SERVERS') {
            steps { 
                 sh 'sh scripts/RemoteServersAutomationScript.sh'
           }
        } 

        stage('DEPLOY DIRECTION APP ON DEV SERVER') {
             when {
                branch "develop"
            }
            steps {
                sh 'sh scripts/playbook.sh'      
                }
        }  

        stage('DEPLOY DIRECTION APP ON PROD SERVER') {
             when {
                branch "main"
            }
            steps {
                sh 'sh scripts/playbook.sh'      
            }
        }   
    }
}





