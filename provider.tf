<<<<<<< HEAD
=======
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
>>>>>>> parent of 943322d... Update provider.tf

#configuring the AWS Provider

  provider "aws" {
  region = "us-east-1"
}
