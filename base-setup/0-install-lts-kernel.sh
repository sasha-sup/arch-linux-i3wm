!#/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root."
  exit
fi

pacman -Syu
pacman -S sudo linux-lts

for i in 3 2 1; do
    echo "$i..."
    sleep 1
done
echo "Rebooting..."
reboot

