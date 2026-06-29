#!/bin/bash

sudo dnf update -y

sudo dnf install jenkins -y

sudo systemctl start jenkins

sudo systemctl enable jenkins

sudo systemctl status jenkins
