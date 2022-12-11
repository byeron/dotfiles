#!/bin/bash

if [ -d /home/$USER/dotfiles ]; then
        rm -rf /home/$USER/dotfiles
fi
git clone https://github.com/byeron/dotfiles.git /home/$USER/dotfiles

ln -sf /home/$USER/dotfiles/bashrc /home/$USER/.bashrc
ln -sf /home/$USER/dotfiles/profile /home/$USER/.profile
ln -sf /home/$USER/dotfiles/vimrc /home/$USER/.vimrc
ln -sfn /home/$USER/dotfiles/config/ /home/$USER/.config
