resource "aws_vpc" "gfg-vpc" {
  cidr_block       = "10.0.0.0/16"  

  tags = {
    Name = "MY-GFG-VPC"
  }
}

resource "aws_subnet" "gfg-subnet" {
  vpc_id     = aws_vpc.gfg-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "My-GFG-Subnet"
  }
}

resource "aws_internet_gateway" "GFG-Gateway" {

    vpc_id = aws_vpc.gfg-vpc.id

    tags = {
      Name= "My-GFG-Gateway"
    }  
}

resource "aws_route_table" "GFG-RT" {
  vpc_id = aws_vpc.gfg-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.GFG-Gateway.id
  }

  tags = {
    Name = "My-GFG-Routing-Table"
  }
}

resource "aws_route_table_association" "GFG-RT-Association" {
  subnet_id      = aws_subnet.gfg-subnet.id 
  route_table_id = aws_route_table.GFG-RT.id
}

resource "aws_security_group" "GFG-SG" {
  name        = "MY-GFG-SG"
  vpc_id      = aws_vpc.gfg-vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 20
    to_port          = 20
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "MY-GFG-SG"
  }
}

resource "aws_instance" "My_VPC-Instance" {

    ami = "ami-08abb3eeacc61972d"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.gfg-subnet.id
    vpc_security_group_ids =  [aws_security_group.GFG-SG.id]
    
    tags = {
      Name="My-VPC-Instance"
    }  
}





