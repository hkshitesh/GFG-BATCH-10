variable "location-2" {
    type = string
    default = "us-east-1"  
}

variable "ami-key-2" {
    type = string
    default = "ami-053b0d53c279acc90"  
}

variable "instance_type-2" {
    type = string
    default = "t2.micro" 
}

variable "tags-2" {
    type = string
    default = "GFG-Instance"  
}

variable "count-2" {
    type = number
    default = 1 
}