terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}
resource "aws_vpc" "project" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
  tags {
    Name = "devops-project"
  }
}
resource "aws_instance" "app_server" {
  ami = "ami-830c94e3"
  instance_type = "t2.micro"
  key_name = "terraform"
  user_data	= file("linux.sh")
  vpc_security_group_ids = [
   Docker.id
  ]
  tags = {
    Name = "open-office"
  }
}
resource "aws_security_group" "Docker" {
  tags = {
    type = "terraform-test-security-group"
  }
  vpc_id = "${aws_vpc.test-env.id}"
  ingress {
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  from_port = 22
    to_port = 22
    protocol = "tcp"
  }
// Terraform removes the default rule
  egress {
   from_port = 0
   to_port = 0
   protocol = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}
variable "docker-image" {
  type        = string
  description = "name of the docker image to deploy"
  default     = "vison91/office_spaces"
}
