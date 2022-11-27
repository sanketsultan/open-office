#! /bin/bash
sudo yum install git -y
mkdir project
cd project/
chmod 777 project
git clone https://github.com/sanketsultan/open-office.git
cd open-office/
chmod 777 open-office
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
python3 app.py &> logs.txt &