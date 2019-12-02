###############################################################################
# Some of the netwokring tools that don't come with Arch Linux
###############################################################################

set -euxo pipefail

yay -S --noconfirm \
    masscan \
    traceroute \
    strace \
    mtr \
    tcpdump \
    ngrep \
    socat \
    mitmproxy \
    dstat \
    gnu-netcat \
    ufw \
    fail2ban \
    ipcalc \
    pv              # monitor progress of data transfer through pipe
