#! /bin/bash
sudo yum update -y
sudo yum install -y docker
sudo service docker start
sudo usermod -a -G docker ec2-user
docker pull vison91/office_spaces
sudo docker run --name vison91/office_spaces -p 80:80 -d vison91/office_spaces

