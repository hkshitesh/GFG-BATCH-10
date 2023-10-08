resource "aws_instance" "my-new-instance" {
    ami = "ami-078efad6f7ec18b8a"
    instance_type = "t2.micro"

    tags = {
      Name = "My Terrform-Instance"
    }  
}