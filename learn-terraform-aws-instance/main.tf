terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-3"
}

resource "aws_instance" "app_server_paul" {
  ami           = "ami-06ad2ef8cd7012912"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}