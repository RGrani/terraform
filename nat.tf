# Elastic IP for NAT Gateway

resource "aws_eip" "nat_eip" {
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
  tags = {
    Name = "NAT Gateway EIP"
  }
}

# NAT Gateway for VPC

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.Subnet_1.id

  tags = {
    Name = "NAT gw"
  }

  # To ensure proper ordering, add an explicit dependency
  # on the Internet Gateway for the VPC.
  
  depends_on = [aws_internet_gateway.igw]
}


# create Private route table

resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.First_VPC.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }

  tags = {
    Name = "Private Route Table"
  }
}

# Create Private Subnet association with Private route table

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.application-subnet-1.id
  route_table_id = aws_route_table.private_rt.id
}

