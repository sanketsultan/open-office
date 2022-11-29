[Unit]
Description=Gunicorn instance for a simple hello world app
After=network.target
[Service]
User=ec2-user
Group=www-data
WorkingDirectory=/home/ec2-user/open-office
ExecStart=python3 app.py
[Install]
WantedBy=multi-user.target