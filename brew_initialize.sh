#!/bin/bash
source /home/$USER/.profile
# if [ -d /home/$USER/dotfiles ]; then
#         rm -rf /home/$USER/dotfiles
# fi
# git clone https://github.com/byeron/dotfiles.git /home/$USER/dotfiles
ln -sf /home/$USER/dotfiles/Brewfile /home/$USER/Brewfile

brew bundle
