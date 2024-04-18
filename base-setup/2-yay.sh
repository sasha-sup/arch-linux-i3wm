#!/bin/bash
mkdir /tmp/yay && cd /tmp/yay
curl -OJ 'https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=yay'
makepkg -si
rm -rf /tmp/yay


yay -S --noconfirm \
      google-chrome \
      slack-desktop \
      zoom \
      skypeforlinux-stable-bin \
      pinta \
      aws-cli-v2 \
      thinkfan \
      wifi-qr \
      minikube \
      xmind \
      lens-bin \
