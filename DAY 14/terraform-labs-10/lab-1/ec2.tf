resource "aws_instance" "gfg-instance" {
    ami = var.ami-key
    instance_type = var.instance-ty
    count = 2
    
    tags = {
        Name = "My-GFG-Instance"
    }  
}