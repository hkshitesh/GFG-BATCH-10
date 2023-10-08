resource "aws_instance" "gfg-instance" {

    ami = var.ami-key-2
    instance_type = var.instance_type-2
    count = var.count-2

    tags = {
      Name = var.tags-2
    }  
}

