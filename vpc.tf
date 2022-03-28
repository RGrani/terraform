# Create VPC

resource "aws_vpc" "First_VPC" {
  cidr_block = "10.0.0.0/16"
  
  tags = {
    Name = "Demo VPC"
  }
}



