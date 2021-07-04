#/usr/bin/bash

set -euxo pipefail

ssh-keygen -t rsa -b 4096 -C "your@email" -f ~/.ssh/$USER

# Pacman
yay -S --noconfirm \
    pacman-contrib

# X server
yay -S --noconfirm \
    xrandr \
    xclip \
    xorg

# Audio & Bluetooth
yay -S --noconfirm \
    bluez \
    alsa-utils \
    bluez-libs \
    bluez-utils \
    pulseaudio-alsa \
    pulseaudio-bluetooth \
    blueman

# Graphic Card
yay -S --noconfirm \
    nvidia

# Screen and Utility
yay -s --noconfirm \
    i3 \
    i3-gaps \
    i3-lock \ 
    i3-lock-color \
    i3-lock-fancy \
    dunst \
    rofi \
    lightdm \
    lightdm-slick-greeter \
    feh \
    brave-git \
    gnome-terminal \
    git \
    tmux \
    unzip \
    tree \
    vim \
    s-tui \
    htop \
    mosh \
    ncdu \
    fast \
    barrier


# pull dot files from repo
dots=(
        https://raw.githubusercontent.com/yelbmew/Public-Dot-Files/master/.bashrc
        https://raw.githubusercontent.com/yelbmew/Public-Dot-Files/master/.tmux.conf
        https://raw.githubusercontent.com/yelbmew/Public-Dot-Files/master/.vimrc
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


# install Vim plugin listed in .vimrc
vim +PluginInstall +qall

reboot
