# create Internet Gateway

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.First_VPC.id
  
  tags = {
    Name = "First_IGW"
  }
}

# create web layer route table

resource "aws_route_table" "web-rt" {
  vpc_id = aws_vpc.First_VPC.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "WebRT"
  }
}

# Create Web Subnet association with Web route table

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.Subnet_1.id
  route_table_id = aws_route_table.web-rt.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = aws_subnet.Subnet_2.id
  route_table_id = aws_route_table.web-rt.id
}
