#/usr/bin/bash

set -euxo pipefail \

# Universal Package Manager
sudo dnf install \
    snapd 

# X Server
dnf groupinstall -y \
    base-x

# Tools
dnf install -y \
    firefox \
    git \
    gnome-terminal \
    htop \
    i3 \
    lightdm \
    mosh \
    sxiv \
    tmux \
    transmission-cli \
    tree \
    unzip \
    vim 


# Yubikey
 dnf install -y \
     ykclient* \
     ykpers* \
     pam_yubico 

if [ -e $HOME/.vimrc ]; then
    echo "File exits"
fi

ssh-keygen -t rsa -b 4096 -C "your@email.com" -f ~/.ssh/yourname

systemctl enable lightdm.service
systemctl set-default graphical.service
# reboot


# n -> note
# n: roll back to text base prompt login
# systemctl set-default multi-user.target
