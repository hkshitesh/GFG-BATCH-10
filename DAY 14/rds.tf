resource "aws_default_vpc" "default-vpc" {
  tags = {
    Name = "Default VPC"
  }
}

data "aws_availability_zones" "available-zones" {}

resource "aws_default_subnet" "subnet_az1" {
  availability_zone = data.aws_availability_zones.available-zones.names[0]  
}

resource "aws_default_subnet" "subnet_az2" {
  availability_zone = data.aws_availability_zones.available-zones.names[1]  
}

resource "aws_security_group" "web-sg" {
  name        = "web-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_default_vpc.default-vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}

resource "aws_security_group" "db-sg" {
  name        = "db-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_default_vpc.default-vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups = [aws_security_group.web-sg.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db-sg"
  }
}


resource "aws_db_instance" "mydb" {
  allocated_storage    = 10
  db_name              = "gfgmydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  username             = "admin"
  password             = "gfgdb123"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}