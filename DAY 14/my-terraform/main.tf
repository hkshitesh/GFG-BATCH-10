terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.1.0"
    }
  }
}

provider "aws" {

    region = "ap-south-1"
    access_key = "AKIARHMAY7J2DAF5MBFH"
    secret_key = "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"  
}