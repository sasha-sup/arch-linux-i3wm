#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root."
  exit 1
fi

pacman -Syu --noconfirm
pacman -Sy --needed --noconfirm \
    vim \
    code \
    locate \
    strace \
    stress \
    net-tools \
    lsof \
    bind-tools \
    base-devel \
    git \
    ansible \
    docker docker-compose \
    python3 python-pip \
    nmap \
    zip unzip \
    dolphin \
    ksnip \
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
    konsole \
    terminator \
    noto-fonts-emoji ttf-dejavu noto-fonts \
    feh \
    jq \
    bc \
    telegram-desktop \
    tlp \
    smartmontools \
    ntfs-3g \
    brightnessctl \
    cronie \
    tree \
    rsync \
    postgresql \
    python-virtualenv \
    gcc \
    dbeaver \
    ntfs-3g \
    mtpfs \
    android-tools \
    bitwarden \
    fdupes \
    cheese \
    terraform
systemctl enable --now tlp
# docker post install steps
usermod -aG docker $USER
# emoji
fc-cache -fv
# wireguuard
modprobe wireguard
echo "wireguard" | sudo tee -a /etc/modules-load.d/modules.conf
