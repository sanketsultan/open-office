#! /bin/bash
sudo yum install git -y
git clone https://github.com/sanketsultan/open-office.git
cd open-office/
sudo python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
setsid python3 app.py &
echo "file executed successfully"