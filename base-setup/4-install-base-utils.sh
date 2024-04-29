#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root."
  exit 1
fi

pacman -Syu --noconfirm
pacman -Sy --needed --noconfirm \
    vim code locate strace stress net-tools lsof bind-tools base-devel \
    git ansible ansible-lint docker docker-compose python3 python-pip python-requests \
    nmap zip unzip dolphin flameshot thunderbird mc vlc libreoffice-fresh \
    transmission-cli htop openvpn wireguard-tools gedit mtr konsole terminator \
    noto-fonts-emoji ttf-dejavu noto-fonts feh jq bc telegram-desktop tlp \
    smartmontools ntfs-3g brightnessctl cronie tree rsync postgresql \
    python-virtualenv gcc dbeaver ntfs-3g mtpfs android-tools bitwarden \
    fdupes cheese terraform man kde-cli-tools netcat i3lock \
    lightdm-gtk-greeter-settings neofetch ttf-nerd-fonts-symbols ttf-font-nerd \
    moreutils dunst kubectl inetutils xautolock xorg-xrandr sshpass bash-completion helm usbutils
    

# kubectl autocomplete
kubectl completion bash > ~/.kube/completion.bash.inc
printf "
# kubectl shell completion
source '$HOME/.kube/completion.bash.inc'
" >> $HOME/.bash_profile
     
systemctl enable --now tlp # <---???
# docker post install steps
usermod -aG docker $USER
# emoji
fc-cache -fv
# wireguuard
modprobe wireguard
echo "wireguard" | sudo tee -a /etc/modules-load.d/modules.conf
# ledger-live
# https://support.ledger.com/hc/en-us/articles/115005165269?utm_source=ledger_live_desktop&utm_medium=self_referral&utm_content=error_cantopendevice&support=true
wget -q -O - https://raw.githubusercontent.com/LedgerHQ/udev-rules/master/add_udev_rules.sh | sudo bash

# Autoclean 
pacman -Qtdq | ifne sudo pacman -Rns -