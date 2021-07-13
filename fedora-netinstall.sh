#/usr/bin/bash

set -euxo pipefail

ssh-keygen -t rsa -b 4096 -C "your@email" -f ~/.ssh/$USER


# Snapd - Universal Package Manager
sudo dnf install -y \
    snapd 


# Yubikey
 sudo dnf install -y \
     ykclient* \
     pam_yubico 
     libyubikey \
     yubikey-manager \
     yubikey-personalization-gui


# Audio & Bluetooth
sudo dnf install -y \
    bluez \
    alsa-utils
    pulseaudio \
    pavucontrol \
    pulseaudio-libs \
    pulseaudio-utils


# Powerline for Bash and Tmux
sudo dnf install -y \
    powerline \
    powerline-fonts \
    tmux-powerline


# X Server
sudo dnf groupinstall -y \
    base-x


# Tools
sudo dnf install -y \
    firefox \
    git \
    gnome-terminal \
    htop \
    i3 \
    i3lock \
    mosh \
    sxiv \
    tmux \
    transmission-cli \
    tree \
    unzip \
    vim \
    xclip \
    NetworkManager-wifi \
    dbus-x11 \
    rofi \
    flameshot


# pull dot files from repo
dots=(
        https://raw.githubusercontent.com/yelbmew/Public-Dot-Files/master/.bashrc
        https://raw.githubusercontent.com/yelbmew/Public-Dot-Files/master/.tmux.conf
        https://raw.githubusercontent.com/yelbmew/Public-Dot-Files/master/.vimrc
        https://raw.githubusercontent.com/yelbmew/Public-Dot-Files/master/.xinitrc
     ); cd $HOME; for i in ${dots[@]}; do curl -O $i; done


# source: transfer.sh for easy/secure file sharing
if [ -e $HOME/.bashrc ]; then
cat >> $HOME/.bashrc <<- EOF
transfer() { if [ \$# -eq 0 ];
then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=\$( mktemp -t transferXXX ); if tty -s; then basefile=\$(basename "\$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g');
curl --progress-bar --upload-file "\$1" "https://transfer.sh/\$basefile" >> \$tmpfile;
else curl --progress-bar --upload-file "-" "https://transfer.sh/\$1" >> \$tmpfile ; fi; cat \$tmpfile; rm -f \$tmpfile; }
EOF
fi 


# Vundle plugin manger for Vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


# pull Vim colorscheme
if [ -d $HOME/.vim ]; then
    mkdir -p $HOME/.vim/colors && cd $HOME/.vim/colors
    curl -o lucario.vim https://raw.githubusercontent.com/raphamorim/lucario/master/colors/lucario.vim
fi

# enable gnome-terminal to launch in i3 without using dbus-launch
sudo bash -c 'echo LANG=\"en_US.UTF-8\" > /etc/default/locale'

# install Vim plugin listed in .vimrc
vim +PluginInstall +qall

reboot
