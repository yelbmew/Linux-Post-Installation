#/usr/bin/bash

set -euxo pipefail \

# ssh-keygen -t rsa -b 4096 -C "your@email" -f ~/.ssh/$USER

# # Universal Package Manager
# sudo dnf install \
#     snapd 
# 
# # X Server
# dnf groupinstall -y \
#     base-x
# 
# # Tools
# dnf install -y \
#     firefox \
#     git \
#     gnome-terminal \
#     htop \
#     i3 \
#     lightdm \
#     mosh \
#     sxiv \
#     tmux \
#     transmission-cli \
#     tree \
#     unzip \
#     vim 
# 
# 
# # Yubikey
#  dnf install -y \
#      ykclient* \
#      ykpers* \
#      pam_yubico 
# 
# # powerline for bash and tmux
# dnf install -y \
#     powerline \
#     powerline-fonts \
#     tmux-powerline


dots=(
        https://raw.githubusercontent.com/yelbmew/Public-Dot-Files/master/.bashrc
        https://raw.githubusercontent.com/yelbmew/Public-Dot-Files/master/.tmux.conf
        https://raw.githubusercontent.com/yelbmew/Public-Dot-Files/master/.vimrc
     ); cd $HOME/temp; for i in ${dots[@]}; do curl -O $i; done


if [ -e $HOME/temp/bashrc ]; then
cat >> $HOME/temp/bashrc <<- EOF
transfer() { if [ $# -eq 0 ];
then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=\$( mktemp -t transferXXX ); if tty -s; then basefile=\$(basename "\$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g');
curl --progress-bar --upload-file "\$1" "https://transfer.sh/\$basefile" >> \$tmpfile;
else curl --progress-bar --upload-file "-" "https://transfer.sh/\$1" >> \$tmpfile ; fi; cat \$tmpfile; rm -f \$tmpfile; }
EOF
fi 


# implement git package manager
    # vundle
    # how to automate vundle install ?
#

# systemctl enable lightdm.service
# systemctl set-default graphical.service
# reboot


# n -> note
# n: roll back to text base prompt login
# systemctl set-default multi-user.target
