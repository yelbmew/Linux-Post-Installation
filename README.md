## Linux Post Installation Script
### Distro cover:
1. Fedora Netinstall (tested on fresh install)
2. Arch (in tweaking)


### Why:
The intention is to reduce the time I spend on setting up development environment on a new machine. <br />
You might probably find the script useful. <br />
<br />
Powerline for bash, tmux and vim has included and the end result will look like this:
![](https://i.imgur.com/8Z1sEVp.png)

![](https://i.imgur.com/iJBVGYR.png)

### How:

#### Fedora example
step 1: curl -o fedora.sh https://raw.githubusercontent.com/yelbmew/Linux-Post-Installation/master/fedora-netinstall.sh  <br />
step 2: chmod +x fedora.sh <br />
step 3: ./fedora.sh <br />

After reboot, login and type startx. I will skip display manager as of now.

*you might want to update the email inside the script for the ssh key*

### Pull Request:
If you find the script can be more simple or it is missing out on some tools or packages, **Please open a pull request**
