pipeline {
    

environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
agent any
    tools {
  terraform 'terraform-11'
}

    stages {

         stage('git checkout') {
            steps {
                  git branch: 'main', url: 'https://github.com/RGrani/terraform'
                    
                   }
         }
       
        stage('Terraform Init') {
            steps {
                  sh '''terraform init'''
            }
        }
        
        stage('Terraform Plan') {
            steps {
            sh 'terraform plan'

            }
        }
    }
    

       stage('Terraform Apply') {
            steps {
            sh '''terraform apply'''

            }
        }
    }

}
