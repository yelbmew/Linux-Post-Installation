#/usr/bin/bash

set -euxo pipefail \

ssh-keygen -t rsa -b 4096 -C "your@email" -f ~/.ssh/$USER

# Universal Package Manager
sudo dnf install -y \
    snapd 

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
    lightdm \
    mosh \
    sxiv \
    tmux \
    transmission-cli \
    tree \
    unzip \
    vim 


# Yubikey
 sudo dnf install -y \
     ykclient* \
     ykpers* \
     pam_yubico 

# powerline for bash and tmux
sudo dnf install -y \
    powerline \
    powerline-fonts \
    tmux-powerline


dots=(
        https://raw.githubusercontent.com/yelbmew/Public-Dot-Files/master/.bashrc
        https://raw.githubusercontent.com/yelbmew/Public-Dot-Files/master/.tmux.conf
        https://raw.githubusercontent.com/yelbmew/Public-Dot-Files/master/.vimrc
     ); cd $HOME; for i in ${dots[@]}; do curl -O $i; done


if [ -e $HOME/.bashrc ]; then
cat >> $HOME/.bashrc <<- EOF
transfer() { if [ $# -eq 0 ];
then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=\$( mktemp -t transferXXX ); if tty -s; then basefile=\$(basename "\$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g');
curl --progress-bar --upload-file "\$1" "https://transfer.sh/\$basefile" >> \$tmpfile;
else curl --progress-bar --upload-file "-" "https://transfer.sh/\$1" >> \$tmpfile ; fi; cat \$tmpfile; rm -f \$tmpfile; }
EOF
fi 

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

if [ -d $HOME/.vim ]; then
    mkdir -p $HOME/.vim/colors && cd $HOME/.vim/colors
    curl -o lucario.vim https://raw.githubusercontent.com/raphamorim/lucario/master/colors/lucario.vim
fi

vim +PluginInstall +qall

systemctl enable lightdm.service
systemctl set-default graphical.target
reboot

# note: roll back to text base prompt login
# systemctl set-default multi-user.target
