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
  ingress {
    description      = "HTTP"
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  ingress {
    description      = "HTTP"
    from_port        = 5000
    to_port          = 5000
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
  vpc_security_group_ids = ["${aws_security_group.devops-project.id}"]
  # user_data              = file("temp.sh")
  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.public_ip
    private_key = file("terraform-key.pem")
    # public_key = file("/home/ubuntu/terraform-key.pem")
  }

  provisioner "file" {
    source      = "ubuntu.sh"
    destination = "/home/ubuntu/ubuntu.sh"
  }


  provisioner "remote-exec" {
    # script = ["sudo chmod home/ubuntu/ubuntu.sh","./ubuntu.sh"]
    inline = [
      "sudo chmod 777 /home/ubuntu/ubuntu.sh",
      "/home/ubuntu/ubuntu.sh",
      "nohup python /open-office/app.py",
      
    ]
  }

  tags = {
    Name = "open-office"
  }
}


# variable "docker-image" {
#   type        = string
#   description = "name of the docker image to deploy"
#   default     = "vison91/office_spaces"
# }
