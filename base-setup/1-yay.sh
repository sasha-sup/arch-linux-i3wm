#!/bin/bash
git clone https://aur.archlinux.org/yay-git.git
cd yay
makepkg -si

yay -S --noconfirm \
      google-chrome \
      slack-desktop \
      zoom \
      1password \
      skypeforlinux-stable-bin \
      pinta \
      aws-cli-v2 \
      thinkfan \
      wifi-qr \
      
