!#/bin/bash

# Check if the script is run as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root."
  exit
fi

# Install packeges
pacman -S fprintd libfprint

# Enter username
read -p "Enter username: " USERNAME

echo -e "Enroll rigth index finger...\n"
fprintd-enroll -f "right-index-finger" $USERNAME

echo -e "\nEnroll left index finger...\n"
fprintd-enroll -f "left-index-finger" $USERNAME

echo -e "\nEnable PAM authentication..."
# Add the line to /etc/pam.d/sudo
sed -i '1iauth       sufficient pam_fprintd.so' /etc/pam.d/sudo
# Add the line to /etc/pam.d/system-local-login
sed -i '1iauth       sufficient pam_fprintd.so' /etc/pam.d/system-local-login
echo "PAM authentication enabled successfully."
echo "Fingerprint setup completed."
