#!/bin/bash

echo $PASSWORD | sudo apt update
echo $PASSWORD | sudo apt install -y xrdp

# ref: https://gihyo.jp/admin/serial/01/ubuntu-recipe/0621

if [ ! -e /etc/xrdp/startubuntu.sh ]; then
    echo "#!/bin/sh" > startubuntu_tmp.sh
    echo "export GNOME_SHELL_SESSION_MODE=ubuntu" >> startubuntu_tmp.sh
    echo "export XDG_CURRENT_DESKTOP=ubuntu:GNOME" >> startubuntu_tmp.sh
    echo "exec /etc/xrdp/startwm.sh" >> startubuntu_tmp.sh
    echo $PASSWORD | sudo -S mv startubuntu_tmp.sh /etc/xrdp/startubuntu.sh
    echo $PASSWORD | sudo -S chmod a+x /etc/xrdp/startubuntu.sh
fi

echo $PASSWORD | sudo sed -i_orig -e 's/startwm/startubuntu/g' /etc/xrdp/sesman.ini

# rename the redirected drives to 'shared-drives'
echo $PASSWORD | sudo sed -i -e 's/FuseMountName=thinclient_drives/FuseMountName=shared-drives/g' /etc/xrdp/sesman.ini

# Changed the allowed_users
if [ ! -e /etc/X11/Xwrapper.config ]; then
    echo "allowed_users=anybody" > Xwrapper_config_tmp
    echo $PASSWORD | sudo -S mv Xwrapper_config_tmp /etc/X11/Xwrapper.config
else
    echo $PASSWORD | sudo -S sed -i_orig -e 's/allowed_users=console/allowed_users=anybody/g' /etc/X11/Xwrapper.config
fi

# Configure the policy xrdp session
if [ -e /etc/polkit-1/localauthority.conf.d/02-allow-colord.conf ]; then
echo $PASSWORD | sudo rm /etc/polkit-1/localauthority.conf.d/02-allow-colord.conf
echo "[Allow Colord all Users]" > colord_tmp.pkla
echo "Identity=unix-user:*" >> colord_tmp.pkla
echo "Action=org.freedesktop.color-manager.create-device;org.freedesktop.color-manager.create-profile;org.freedesktop.color-manager.delete-device;org.freedesktop.color-manager.delete-profile;org.freedesktop.color-manager.modify-device;org.freedesktop.color-manager.modify-profile" >> colord_tmp.pkla
echo "ResultAny=no" >> colord_tmp.pkla
echo "ResultInactive=no" >> colord_tmp.pkla
echo "ResultActive=yes" >> colord_tmp.pkla

echo $PASSWORD | sudo -S mv colord_tmp.pkla /etc/polkit-1/localauthority/50-local.d/45-allow-colord.pkla

# https://askubuntu.com/questions/1193810/authentication-required-to-refresh-system-repositories-in-ubuntu-19-10
echo "[Allow Package Management all Users]" > allow_update_repo_tmp.pkla
echo "Identity=unix-user:*" >> allow_update_repo_tmp.pkla
echo "Action=org.freedesktop.packagekit.system-sources-refresh" >> allow_update_repo_tmp.pkla
echo "ResultAny=yes" >> allow_update_repo_tmp.pkla
echo "ResultInactive=yes" >> allow_update_repo_tmp.pkla
echo "ResultActive=yes" >> allow_update_repo_tmp.pkla

echo $PASSWORD | sudo -S mv allow_update_repo_tmp.pkla /etc/polkit-1/localauthority/50-local.d/46-allow-update-repo.pkla
