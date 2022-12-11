#!/bin/bash
source /home/$USER/.profile
ln -sf /home/$USER/dotfiles/Brewfile /home/$USER/Brewfile
brew bundle --file /home/$USER/Brewfile
