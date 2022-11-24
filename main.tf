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
  region  = "eu-west-1"
}

# ###########Security Group#####################

# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic"
#   vpc_id      = vpc-0b3bde132ef075470

#   ingress {
#     description      = "TLS from VPC"
#     from_port        = 443
#     to_port          = 443
#     protocol         = "tcp"
#     cidr_blocks      = [aws_vpc.main.cidr_block]
#     ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = "allow_tls"
#   }
# }


resource "aws_instance" "app_server" {
  ami = "ami-830c94e3"
  instance_type = "t3.medium"
  key_name = "terraform"
  user_data	= file("linux.sh")
  tags = {
    Name = "open-office"
  }
}

# variable "docker-image" {
#   type        = string
#   description = "name of the docker image to deploy"
#   default     = "vison91/office_spaces"
# }
