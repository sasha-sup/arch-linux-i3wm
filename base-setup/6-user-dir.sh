#!/bin/bash

DIR_NAMES=("Software" ".ssh" "Pictures/screenshot" "Pictures/wallpapers" "Code" "Documents" "Downloads" "ssh-me" "keys" "vpn" ".config/terminator/plugins")
for DIR_NAME in "${DIR_NAMES[@]}"; do
    mkdir -p "$HOME/$DIR_NAME"
done

wget https://git.io/v5Zww -O $HOME"/.config/terminator/plugins/terminator-themes.py"
wget https://download.live.ledger.com/latest/linux -O $HOME"/Software/ledger.Appimage"
wget https://github.com/balena-io/etcher/releases/download/v1.18.11/balenaEtcher-1.18.11-x64.AppImage -O $HOME"/Software/balenaEtcher.Appimage"
wget https://github.com/mltframework/shotcut/releases/download/v23.07.29/shotcut-linux-x86_64-230729.AppImage -O $HOME"/Software/shotcut.AppImage"
