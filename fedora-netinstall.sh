#/usr/bin/bash

set -euxo pipefail \

# Universal Package Manager
sudo dnf isntall \
    snapd 

# X Server
dnf groupinstall -y \
    base-x

# Tools
dnf install -y \
    i3 \
    vim \
    tmux \
    sxiv \
    firefox \
    gnome-terminal \
    git \
    unzip \
    tree \
    htop \
    lightdm \
    transmission-cli \
    mosh 


# Yubikey Essential
dnf install -y \
    ykclients* \
    ykpers* \
    pam_yubico 
