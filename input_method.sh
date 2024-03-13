#!/bin/bash

echo $PASSWORD | sudo apt -y install fcitx5-mozc fcitx5 --install-recommends
echo $PASSWORD | sudo apt -y remove ibus-mozc ibus-table ibus-gtk ibus-gtk3
im-config -n fcitx5
sed -i "/EnabledIMList/s/mozc:False/mozc:True/g" ~/.config/fcitx/profile
