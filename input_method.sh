#!/bin/bash

echo $PASSWORD | sudo apt -y install fcitx5-mozc fcitx-bin
echo $PASSWORD | sudo apt -y remove ibus-mozc ibus-table ibus-gtk ibus-gtk3
echo $PASSWORD | sudo apt -y install fcitx-bin
im-config -n fcitx5
sed -i "/EnabledIMList/s/mozc:False/mozc:True/g" ~/.config/fcitx/profile
