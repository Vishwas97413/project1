!#/bin/bash

sudo dnf update -y

sudo dnf install git -y

sudo systemctl start git

sudo systemctl enable git

sudo systemctl status git

