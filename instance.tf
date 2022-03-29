

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

# Create Database Sunet Group
 
resource "aws_db_subnet_group" "database_subnet" {
  name       = "main"
  subnet_ids = [aws_subnet.database-subnet-1.id, aws_subnet.database-subnet-2.id]

resource "aws_db_instance" "database" {
  allocated_storage      = 10
  db_subnet_group_name   = aws_db_subnet_group.database_subnet.id
  engine                 = "mysql"
  engine_version         = "8.0.20"
  instance_class         = "db.t2.micro"
  multi_az               = true
  name                   = "mydb"
  #username               = "Jenkins"
  #password               = "Ranigupta@2117"
  skip_final_snapshot    = true
  vpc_security_group_ids = ["${aws_security_group.database-sg.id}"]
}

  tags = {
    Name = "My DB subnet group"
  }
}

output "address" {
  
  value = aws_elb.EC2Terraform.dns_name
}
