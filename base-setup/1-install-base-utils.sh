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

yay -S --noconfirm \
      google-chrome \




# Docker post install step
usermod -aG docker $USERNAME

# Terraform
curl -LO https://releases.hashicorp.com/terraform/1.1.5/terraform_1.1.5_linux_amd64.zip
unzip terraform_1.1.5_linux_amd64.zip
mv terraform /usr/local/bin/

# Add ssh keys
mkdir /home/$USERNAME/.ssh
  
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

