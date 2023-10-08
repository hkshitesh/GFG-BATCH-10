terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.20.0"
    }
  }
}

provider "aws" {
  region = var.location
  access_key = "AKIA4ERPRUEUSWX6FEXQ"
  secret_key = "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"
}