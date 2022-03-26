# Terraform_Ec2_Nginx_S3backend
Creating Ec2 instance 
Creating Security Group and attaching it with newly created Ec2
Installing Nginx 
Creating Load balancer  --> listner --> Target Group --> attaching that target group
Using S3 bucket for terraform backend files

#Terraform Commands
terraform validate
terraform fmt  --> This command make proper indentation in your file
terraform init --> This command download essential plugins for terraform as per requirement
terraform plan --> This command give you overview of things that is going to happen 
terraform apply --> This command apply your code / Run terraform code to execute the task
terraform destroy --> This command destroy the existing project

