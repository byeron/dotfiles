#!/bin/bash

echo $PASSWORD | for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get -y remove $pkg; done
echo $PASSWORD | sudo apt update
echo $PASSWORD | sudo apt install -y ca-certificates curl
echo $PASSWORD | sudo install -m 0755 -d /etc/apt/keyrings
echo $PASSWORD | sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
echo $PASSWORD | sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo $PASSWORD | sudo apt-get update
echo $PASSWORD | sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin 
