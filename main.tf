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
  region = "eu-west-1"
}

#############Security Group###################

resource "aws_security_group" "devops-project" {
  name        = "security-group-terraform"
  description = "security-group-terraform"
  vpc_id      = "vpc-0c735787e36a3c094"

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "HTTPS"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "devops-project"
  }
}


resource "aws_instance" "app_server" {
  ami                    = "ami-096800910c1b781ba"
  instance_type          = "t3.medium"
  key_name               = "terraform-key"
  vpc_security_group_ids = ["${aws_security_group.devops-project.name}"]
  user_data              = <<-EOL
  #! /bin/bash
  sudo apt update
  sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"
  sudo apt update
  sudo apt-get install docker-ce
  sudo systemctl start docker
  sudo systemctl enable docker
  sudo groupadd docker
  sudo usermod -aG docker ubuntu
  sudo docker pull vison91/office_spaces:latest
  sudo docker run --name vison91/office_spaces -p 80:80 -d vison91/office_spaces

  EOL
  tags = {
    Name = "open-office"
  }
}

# variable "docker-image" {
#   type        = string
#   description = "name of the docker image to deploy"
#   default     = "vison91/office_spaces"
# }
