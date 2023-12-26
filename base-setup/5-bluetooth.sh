#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root."
  exit 1
fi

pacman -S bluez blueberry blueman-applet

systemctl enable bluetooth
systemctl start bluetooth
