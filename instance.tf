

# Now here we are creating Ec2 instance for our web server

resource "aws_instance" "EC2Terraform" {
  ami                    = var.ami
  instance_type          = var.ins_type
  key_name               = "tests"
  vpc_security_group_ids = ["${aws_security_group.Security_TF.id}"]
  subnet_id              = aws_subnet.Subnet_1.id
  tags = {
    Name = "F1_instance"
  }
  user_data = file("${path.module}/script.sh")
}


resource "aws_instance" "EC2Terraform_1" {
  ami                    = var.ami
  instance_type          = var.ins_type
  key_name               = "tests"
  vpc_security_group_ids = ["${aws_security_group.Security_TF.id}"]
  subnet_id              = aws_subnet.Subnet_2.id
  tags = {
    Name = "F2_instance2"
  }
  user_data = file("${path.module}/script.sh")
}

# create EC2 in private subnet

resource "aws_instance" "EC2Terraform_3" {
  ami                    = var.ami
  instance_type          = var.ins_type
  key_name               = "tests"
  vpc_security_group_ids = ["${aws_security_group.Security_TF.id}"]
  subnet_id              = aws_subnet.application-subnet-1.id
  associate_public_ip_address = false
  tags = {
    Name = "EC2_instance3"
  }
}


output "address" {
  
  value = aws_elb.EC2Terraform.dns_name
}
