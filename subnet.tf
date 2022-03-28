#create web Public Subnet

resource "aws_subnet" "Subnet_1" {
  vpc_id                  = aws_vpc.First_VPC.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet_1"
  }
}

resource "aws_subnet" "Subnet_2" {
  vpc_id                  = aws_vpc.First_VPC.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet_2"
  }
}

# Create Application Private Subnet

resource "aws_subnet" "application-subnet-1" {
  vpc_id                  = aws_vpc.First_VPC.id
  cidr_block              = "10.0.11.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = false
  tags = {
    Name = "Application-1a"
  }
}

resource "aws_subnet" "application-subnet-2" {
  vpc_id                  = aws_vpc.First_VPC.id
  cidr_block              = "10.0.12.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = false
  tags = {
    Name = "Application-2b"
  }
}



#create Database Private Subnet

resource "aws_subnet" "database-subnet-1" {
  vpc_id                  = aws_vpc.First_VPC.id
  cidr_block              = "10.0.21.0/24"
  availability_zone       = "us-east-1a"
  
  tags = {
    Name = "Database-1a"
  }
}


resource "aws_subnet" "database-subnet-2" {
  vpc_id                  = aws_vpc.First_VPC.id
  cidr_block              = "10.0.22.0/24"
  availability_zone       = "us-east-1b"
  
  tags = {
    Name = "Database-2b"
  }
}
