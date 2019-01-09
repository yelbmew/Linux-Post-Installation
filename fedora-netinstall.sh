#/usr/bin/bash

set -euxo pipefail

# Universal Package Manager
snap

# Tools
dnf install -y
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
    s-tui \
    lightdm \
    transmission \
    transmission-daemon \
    mosh 


# Yubikey Essential
dnf install -y
    ykclients* \
    ykpers* \
    pam_yubico \
