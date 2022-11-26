#! /bin/bash
sudo DEBIAN_FRONTEND=noninteractive apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt-get intsall python-is-python3 -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install python3-virtualenv -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install pip -y
cd /home/ubuntu
git clone https://github.com/sanketsultan/open-office.git
cd open-office
# source .venv/bin/activate
# pip install -r requirements.txt