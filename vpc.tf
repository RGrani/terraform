# 1. Create vpc
resource "aws_vpc" "First_VPC" {
  cidr_block = "10.0.0.0/16"
  
}


# 2. Create Internet Gateway
 

resource "aws_internet_gateway" "First_IGW" {
  vpc_id = aws_vpc.First_VPC.id
}

# 3. create route

resource "aws_route" "Route_Banao" {
  route_table_id         = aws_vpc.First_VPC.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.First_IGW.id
}



