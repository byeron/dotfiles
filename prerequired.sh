#!/bin/bash

output=$(echo $PASSWORD | sudo -kS echo 2>&1 > /dev/null)
if [ $? -ne 0 ]; then
	echo "The password is incorrect"
	exit 1
fi

echo $PASSWORD | sudo -kS apt update
echo $PASSWORD | sudo -kS apt install -y build-essential procps curl file git

# brew
echo "\n" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [ -d /home/$USER/dotfiles ]; then
	rm -rf /home/$USER/dotfiles
fi
git clone https://github.com/byeron/dotfiles.git /home/$USER/dotfiles
ln -sf /home/$USER/dotfiles/profile /home/$USER/.profile
