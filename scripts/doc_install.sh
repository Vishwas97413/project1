#!/bin/bash

sudo dnf update -y

sudo dnf install docker -y

sudo systemctl start docker 

sudo systemctl enable docker

sudo systemctl status docker
