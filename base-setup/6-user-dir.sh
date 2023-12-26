#!/bin/bash

DIR_NAMES=("Software" ".ssh" "Pictures/screenshot" "Code" "Documents" "Downloads" "ssh-me" "keys" "vpn" ".config")
for DIR_NAME in "${DIR_NAMES[@]}"; do
    mkdir -p "/home/$USER/$DIR_NAME"
done

cd /home/$USER/Software

wget -O ledger.Appimage https://download.live.ledger.com/latest/linux
wget -O balenaEtcher.Appimage https://github.com/balena-io/etcher/releases/download/v1.18.11/balenaEtcher-1.18.11-x64.AppImage
wget -O shotcut.AppImage https://github.com/mltframework/shotcut/releases/download/v23.07.29/shotcut-linux-x86_64-230729.AppImage
