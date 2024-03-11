#!/bin/bash

PASSWORD=$PASSWORD USER=$USER bash -c "$(curl -fsSL https://raw.githubusercontent.com/byeron/dotfiles/main/prerequired.sh)"
PASSWORD=$PASSWORD USER=$USER bash -c "$(curl -fsSL https://raw.githubusercontent.com/byeron/dotfiles/main/brew_initialize.sh)"
# PASSWORD=$PASSWORD USER=$USER bash -c "$(curl -fsSL https://raw.githubusercontent.com/byeron/dotfiles/main/font_initialize.sh)"
# PASSWORD=$PASSWORD USER=$USER bash -c "$(curl -fsSL https://raw.githubusercontent.com/byeron/dotfiles/main/vim_initialize.sh)"
# PASSWORD=$PASSWORD USER=$USER bash -c "$(curl -fsSL https://raw.githubusercontent.com/byeron/dotfiles/main/docker_initialize.sh)"
# PASSWORD=$PASSWORD USER=$USER bash -c "$(curl -fsSL https://raw.githubusercontent.com/byeron/dotfiles/main/cargo_bundle.sh)"
# PASSWORD=$PASSWORD USER=$USER bash -c "$(curl -fsSL https://raw.githubusercontent.com/byeron/dotfiles/main/link.sh)"
