#!/bin/bash

echo $PASSWORD | sudo apt update
echo $PASSWORD | sudo apt install -y xrdp

# ref: https://gihyo.jp/admin/serial/01/ubuntu-recipe/0621

if [ ! -e /etc/xrdp/startubuntu.sh ]; then
echo $PASSWORD | sudo cat >> /etc/xrdp/startubuntu.sh << EOF
#!/bin/sh
export GNOME_SHELL_SESSION_MODE=ubuntu
export XDG_CURRENT_DESKTOP=ubuntu:GNOME
exec /etc/xrdp/startwm.sh
EOF
echo $PASSWORD | sudo chmod a+x /etc/xrdp/startubuntu.sh

echo $PASSWORD | sudo sed -i_orig -e 's/startwm/startubuntu/g' /etc/xrdp/sesman.ini

# rename the redirected drives to 'shared-drives'
echo $PASSWORD | sudo sed -i -e 's/FuseMountName=thinclient_drives/FuseMountName=shared-drives/g' /etc/xrdp/sesman.ini

# Changed the allowed_users
if [ ! -e /etc/X11/Xwrapper.config ]; then
echo $PASSWORD | sudo cat >> /etc/X11/Xwrapper.config << EOF
allowed_users=anybody
EOF
else
echo $PASSWORD | sudo sed -i_orig -e 's/allowed_users=console/allowed_users=anybody/g' /etc/X11/Xwrapper.config
fi

# Configure the policy xrdp session
if [ ! -e /etc/polkit-1/localauthority.conf.d/02-allow-colord.conf ]; then
echo $PASSWORD | sudo rm /etc/polkit-1/localauthority.conf.d/02-allow-colord.conf

echo $PASSWORD | sudo cat > /etc/polkit-1/localauthority/50-local.d/45-allow-colord.pkla <<EOF
[Allow Colord all Users]
Identity=unix-user:*
Action=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile
ResultAny=no
ResultInactive=no
ResultActive=yes
EOF

# https://askubuntu.com/questions/1193810/authentication-required-to-refresh-system-repositories-in-ubuntu-19-10
echo $PASSWORD | sudo cat > /etc/polkit-1/localauthority/50-local.d/46-allow-update-repo.pkla<<EOF
[Allow Package Management all Users]
Identity=unix-user:*
Action=org.freedesktop.packagekit.system-sources-refresh
ResultAny=yes
ResultInactive=yes
ResultActive=yes
EOF
