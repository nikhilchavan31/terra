terraform {
  required_version = "~> 1.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
 
# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-2"
}
resource "aws_instance" "linux" {
  ami           = "ami-0c724990058268f4d"
  instance_type = "t3.micro"
  count = 3
  tags = {
    Name = "myinstance ${count.index+1}"
}
}
