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
data "aws_security_group" "selected" {
  name = "launch-wizard-13"
}

resource "aws_security_group" "allow_ssh" {

  description = "Allow ssh inbound traffic"

  ingress {
    description = "ssh"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
resource "aws_instance" "app_server" {
  ami = "ami-830c94e3"
  instance_type = "t2.micro"
  key_name = "terraform"
  user_data	= file("linux.sh")
  vpc_security_group_ids = [
  aws_security_group.allow_ssh.id
  ]
  tags = {
    Name = "open-office"
  }
}

variable "docker-image" {
  type        = string
  description = "name of the docker image to deploy"
  default     = "vison91/office_spaces"
}
