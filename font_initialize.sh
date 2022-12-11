#!/bin/bash

wget https://github.com/yuru7/HackGen/releases/download/v2.7.1/HackGen_NF_v2.7.1.zip
unzip HackGen_NF_v2.7.1.zip
mv HackGen_NF_v2.7.1 HackGen_NF
sudo mv HackGen_NF /usr/share/fonts/
fc-cache -fv
rm HackGen_NF_v2.7.1.zip
