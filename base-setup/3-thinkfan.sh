#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root."
  exit 1
fi

pacman -S lm_sensors --noconfirm

cat <<EOF > /etc/thinkfan.conf
sensors:
  # GPU
  - tpacpi: /proc/acpi/ibm/thermal
    indices: [1]
  # CPU
  - hwmon: /sys/class/hwmon
    name: coretemp
    indices: [2, 3, 4, 5]
  # Chassis
  - hwmon: /sys/class/hwmon
    name: thinkpad
    indices: [3, 5, 6, 7]
  # SSD
  - hwmon: /sys/class/hwmon
    name: nvme
    indices: [1, 2, 3]
    correction: [-5, 0, 0]
  # MB
  - hwmon: /sys/class/hwmon
    name: acpitz
    indices: [1]

fans:
  - tpacpi: /proc/acpi/ibm/fan

levels:
  - [0, 0, 37]
  - [1, 35, 42]
  - [2, 40, 45]
  - [3, 43, 47]
  - [4, 45, 52]
  - [5, 50, 57]
  - [6, 55, 72]
  - [7, 70, 82]
  - ["level full-speed", 77, 32767]
EOF

cat <<EOF > /etc/modules-load.d/modules.conf
thinkpad_acpi
EOF

systemctl enable thinkfan

for i in 3 2 1; do
    echo "$i..."
    sleep 1
done
echo "Rebooting..."
reboot