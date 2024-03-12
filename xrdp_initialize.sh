#!/bin/bash

echo $PASSWORD | sudo apt update
echo $PASSWORD | sudo apt install -y xrdp
