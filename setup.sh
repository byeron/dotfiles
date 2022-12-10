#!/bin/bash

output=$(echo $PASSWORD | sudo -kS echo 2>&1 > /dev/null)
if [ $? -ne 0 ]; then
	echo "The password is incorrect"
	exit 1
fi

echo $PASSWORD | sudo -kS apt update
echo $PASSWORD | sudo -kS apt install -y build-essential procps curl file git

user=$(whoami)

# brew
echo "\n" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo $PASSWORD | sudo -kS echo '# Set PATH, MANPATH, etc., for Homebrew.' >> /home/$user/.profile
echo $PASSWORD | sudo -kS echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> /home/$user/.profile
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
