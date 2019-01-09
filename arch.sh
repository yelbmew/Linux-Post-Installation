#/usr/bin/bash

set -euxo pipefail
# X server
yay -S --noconfirm \
    xrandr
    xclip

# Audio & Bluetooth
yay -S --noconfirm \
    bluez \
    alsa-utils
    bluez-libs \
    bluez-utils \
    pulseaudio-alsa \
    pulseaudio-bluetooth \

# Screen and Utility
yay -s --noconfirm \
    i3 \
    i3-gaps \
    i3-lock \ 
    i3-lock-color \
    i3-lock-fancy \
    rofi \
    lightdm \
    lightdm-slick-greeter \
    feh \
    firefox \
    gnome-terminal \
    git \
    tmux \
    unzip \
    tree \
    vim \
    s-tui \
    htop \
    mosh \

systemctl enable lightdm.service
systemctl enable bluetooth.service
reboot
