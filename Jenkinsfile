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
                  sh 'terraform init'
            }
        }
        
        stage('Terraform Plan') {
            steps {
            sh "terraform plan -input=false -out tfplan "
            sh 'terraform show -no-color tfplan > tfplan.txt'
            }
        }
   
       stage('Terraform Apply') {
            steps {
                sh 'terraform apply -input=false tfplan'

            }
        }
<<<<<<< HEAD
 stage('Terraform Destroy') {
=======
        stage('Terraform Destroy') {
>>>>>>> 943322d9d953c5629b56ac2f47fe10647cc5d66d
            steps {
                sh 'terraform destroy -auto-approve'

            }
        }
<<<<<<< HEAD
=======
      
>>>>>>> 943322d9d953c5629b56ac2f47fe10647cc5d66d
    }

}
