#! /bin/bash
sudo DEBIAN_FRONTEND=noninteractive apt-get update -y
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt install python-is-python3 -y
sudo DEBIAN_FRONTEND=noninteractive apt install python3-virtualenv -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install pip -y
cd /home/ubuntu/open-office/
virtualenv .venv
source .venv/bin/activate
pip install -r requirements.txt
python app.py &