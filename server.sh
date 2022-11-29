[Unit]
Description=Gunicorn instance for a simple hello world app
After=network.target
[Service]
User=ubuntu
Group=www-data
WorkingDirectory=/home/ubuntu/open-office
ExecStart=python /home/ubuntu/open-office/app.py
[Install]
WantedBy=multi-user.target