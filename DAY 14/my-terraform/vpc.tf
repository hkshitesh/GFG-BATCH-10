resource "aws_vpc" "gfg-vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "gfg-subnet" {
  vpc_id     = aws_vpc.gfg-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "gfg-subnet"
  }
}

resource "aws_internet_gateway" "gfg-igw" {
  vpc_id = aws_vpc.gfg-vpc.id

  tags = {
    Name = "gfg-igw"
  }
}

resource "aws_route_table" "gfg-tb" {
  vpc_id = aws_vpc.gfg-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gfg-igw.id
  }

  tags = {
    Name = "gfg-tb"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.gfg-subnet.id
  route_table_id = aws_route_table.gfg-tb.id
}


resource "aws_security_group" "gfg-sg" {
  name        = "gfg-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.gfg-vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 20
    to_port          = 20
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "gfg-sg"
  }
}

resource "aws_instance" "my-vpc-instance" {
    ami = "ami-078efad6f7ec18b8a"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.gfg-subnet.id
    vpc_security_group_ids = [aws_security_group.gfg-sg.id]

    tags = {
      Name = "my-vpc-instance"
    }
  
}