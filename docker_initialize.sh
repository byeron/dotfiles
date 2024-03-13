#!/bin/bash

echo $PASSWORD | sudo apt -y remove docker docker-engine docker.io containerd runc
echo $PASSWORD | sudo apt update
echo $PASSWORD | sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo $PASSWORD | sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --yes --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo $PASSWORD | sudo apt update
echo $PASSWORD | sudo apt -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin
