!#/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root."
  exit
fi

read -p "Enter your username: " USERNAME

# Install base utils 
pacman -Syu
pacman -Sy --needed --noconfirm  \
          networkmanager \
          vim \
          code \
          wireless_tools \
          locate \
          strace \
          stress \
          net-tools \
          lsof \
          bind-tools \
          xf86-input-libinput \
          base-devel \
          git \
          lm_sensors \
          openssh \
          ansible \
          docker docker-compose \
          python python-pip \
          nmap \
          zip unzip \
          iptables \
          xorg-xbacklight \
          alsa-utils \
          xbindkeys \
          acpid \ 
          dolphin \
          scrot \
          wget \
          thunderbird \
          mc \
          vlc \
          libreoffice-fresh \
          transmission-cli \
          htop \
          openvpn \
          wireguard-tools \
          gedit \
          mtr \
          kde-cli-tools \
          konsole \
          terminator \
          fuse2 \
          pulseaudio pulseaudio-alsa \
          alsa-lib alsa-utils \
          noto-fonts-emoji \
          feh \
          bluez bluez-utils blueman \

yay -S --noconfirm \
      google-chrome \
      slack-desktop \
      zoom \
      1password \
      skypeforlinux-stable-bin \
      pinta \
      aws-cli-v2 \

# activate services
SERVICES=("pulseaudio" "bluetooth" "transmission")

for SERVICE in "${SERVICES[@]}" 
do
    systemctl start $SERVICE
    systemctl enable $SERVICE
done

# emoji
fc-cache -fv

# wireguuard
sudo modprobe wireguard
echo "wireguard" | sudo tee -a /etc/modules-load.d/modules.conf

# Docker post install step
usermod -aG docker $USERNAME

# Create user dirs
DIR_NAMES=("Software" ".ssh" "Pictures/screenshot" "Code" "Documents" "Downloads" "ssh-me" "keys" "vpn" ".config")

for DIR_NAME in "${DIR_NAMES[@]}"
do
    mkdir -p "/home/$USERNAME/$DIR_NAME"
done

chown -R $USERNAME:$USERNAME /home/$USERNAME

# mimelist
echo -e "[Default Applications]\ntext/plain=gedit.desktop" >> ~/.config/mimeapps.list

# Ledger Live
wget -P /home/$USERNAME/Software $Software_dir $/home/$USERNAME/Software -O ledger.Appimage https://download.live.ledger.com/latest/linux

# balena Etcher
wget -P /home/$USERNAME/Software -O balenaEtcher.Appimage https://github.com/balena-io/etcher/releases/download/v1.18.11/balenaEtcher-1.18.11-x64.AppImage

# Shotcut
wget -P /home/$USERNAME/Software -O shotcut.AppImage https://github.com/mltframework/shotcut/releases/download/v23.07.29/shotcut-linux-x86_64-230729.AppImage

# Telegram
curl -LO https://telegram.org/dl/desktop/linux
latest_file=$(ls tsetup.*.tar.xz | sort -V | tail -n 1)
tar -xvf "$latest_file" -C /home/$USERNAME/Software
rm -f $latest_file

# Terraform
curl -LO https://releases.hashicorp.com/terraform/1.1.5/terraform_1.1.5_linux_amd64.zip
unzip terraform_1.1.5_linux_amd64.zip
mv terraform /usr/local/bin/

# Enable multitouch
mkdir -p /etc/X11/xorg.conf.d/
echo 'Section "InputClass"
        Identifier "libinput touchpad catchall"
        MatchIsTouchpad "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        NaturalScrolling "true"
        Option "Tapping" "on"
EndSection' > /etc/X11/xorg.conf.d/30-touchpad.conf
echo "30-touchpad.conf has been successfully created/updated."

# Enable sensors
sensors-detect

