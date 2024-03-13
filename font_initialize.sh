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

# ターミナルのデフォルトの設定の ID を取得
default_profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
default_profile=${default_profile:1:-1}  # シングルクォートを削除

# デフォルトの設定の ID に対してフォントを設定する
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$default_profile/" font 'HackGen Console NF 14'
