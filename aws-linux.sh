#! /bin/bash
git clone https://github.com/sanketsultan/open-office.git
sudo chmod a+rwx open-office
cd open-office/
sudo python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
nohup python3 app.py &