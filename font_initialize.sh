#!/bin/bash

if [ -d /home/$USER/dotfiles ]; then
        rm -rf /home/$USER/dotfiles
fi
git clone https://github.com/byeron/dotfiles.git /home/$USER/dotfiles

source /home/$USER/.profile


wget https://github.com/yuru7/HackGen/releases/download/v2.9.0/HackGen_NF_v2.9.0.zip
unzip HackGen_NF_v2.9.0.zip
mv HackGen_NF_v2.9.0 HackGen_NF
echo $PASSWORD | sudo mv HackGen_NF /usr/share/fonts/
fc-cache -fv
rm HackGen_NF_v2.9.0.zip
