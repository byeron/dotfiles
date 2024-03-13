#!/bin/bash

PASSWORD=$PASSWORD USER=$USER bash -c "$(curl -fsSL https://raw.githubusercontent.com/byeron/dotfiles/main/prerequired.sh)"
PASSWORD=$PASSWORD USER=$USER bash -c "$(curl -fsSL https://raw.githubusercontent.com/byeron/dotfiles/main/brew_initialize.sh)"
# PASSWORD=$PASSWORD USER=$USER bash -c "$(curl -fsSL https://raw.githubusercontent.com/byeron/dotfiles/main/font_initialize.sh)"
PASSWORD=$PASSWORD USER=$USER bash -c "$(curl -fsSL https://raw.githubusercontent.com/byeron/dotfiles/main/vim_initialize.sh)"
PASSWORD=$PASSWORD USER=$USER bash -c "$(curl -fsSL https://raw.githubusercontent.com/byeron/dotfiles/main/docker_initialize.sh)"
PASSWORD=$PASSWORD USER=$USER sudo bash -c "$(curl -fsSL https://raw.githubusercontent.com/byeron/dotfiles/main/xrdp_initialize.sh)"
PASSWORD=$PASSWORD USER=$USER bash -c "$(curl -fsSL https://raw.githubusercontent.com/byeron/dotfiles/main/input_method.sh)"
# PASSWORD=$PASSWORD USER=$USER bash -c "$(curl -fsSL https://raw.githubusercontent.com/byeron/dotfiles/main/enhanced-session-mode.sh)"
PASSWORD=$PASSWORD USER=$USER bash -c "$(curl -fsSL https://raw.githubusercontent.com/byeron/dotfiles/main/link.sh)"
