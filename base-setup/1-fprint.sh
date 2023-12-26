#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root."
  exit
fi

pacman -S fprintd libfprint

echo -e "Enroll rigth index finger...\n"
fprintd-enroll -f "right-index-finger" $USER

sleep 5

echo -e "

Enroll left index finger...\n"
fprintd-enroll -f "left-index-finger" $USER

echo -e "\nEnable PAM authentication..."

sed -i '1iauth       sufficient pam_fprintd.so' /etc/pam.d/sudo
sed -i '1iauth       sufficient pam_fprintd.so' /etc/pam.d/system-local-login

echo "Fingerprint setup completed."
