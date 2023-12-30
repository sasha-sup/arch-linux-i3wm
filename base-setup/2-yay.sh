#!/bin/bash

cd $HOME

git clone https://aur.archlinux.org/yay-git.git
cd yay-git
makepkg -si

yay -S --noconfirm \
      google-chrome \
      slack-desktop \
      zoom \
      skypeforlinux-stable-bin \
      pinta \
      aws-cli-v2 \
      thinkfan \
      wifi-qr
