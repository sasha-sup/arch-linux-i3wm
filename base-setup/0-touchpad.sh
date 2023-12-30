#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root."
  exit 1
fi

conf_dir="/etc/X11/xorg.conf.d/"

if [ -d "$conf_dir" ]; then
  echo "Directory $conf_dir already exists."
else
  mkdir -p "$conf_dir"
  echo "Directory $conf_dir created."
fi

echo 'Section "InputClass"
    Identifier "touchpad catchall"
    Driver "libinput"
    Option "Tapping" "on"
EndSection' > "$conf_dir/30-touchpad.conf"

echo "30-touchpad.conf has been successfully updated."
