#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Please run as root."
  exit 1
fi

pacman -S lm_sensors --noconfirm

cat <<EOF > /etc/thinkfan.conf
hwmon /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon4/temp6_input
hwmon /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon4/temp3_input
hwmon /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon4/temp7_input
hwmon /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon4/temp4_input
hwmon /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon4/temp1_input
hwmon /sys/devices/platform/thinkpad_hwmon/hwmon/hwmon4/temp5_input
hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon8/temp3_input
hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon8/temp4_input
hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon8/temp1_input
hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon8/temp5_input
hwmon /sys/devices/platform/coretemp.0/hwmon/hwmon8/temp2_input
hwmon /sys/devices/pci0000:00/0000:00:1d.0/0000:03:00.0/nvme/nvme0/hwmon3/temp3_input
hwmon /sys/devices/pci0000:00/0000:00:1d.0/0000:03:00.0/nvme/nvme0/hwmon3/temp1_input
hwmon /sys/devices/pci0000:00/0000:00:1d.0/0000:03:00.0/nvme/nvme0/hwmon3/temp2_input
hwmon /sys/devices/virtual/thermal/thermal_zone0/hwmon1/temp1_input
hwmon /sys/devices/virtual/thermal/thermal_zone6/hwmon6/temp1_input
hwmon /sys/devices/virtual/thermal/thermal_zone4/hwmon5/temp1_input

tp_fan /proc/acpi/ibm/fan

(0, 0,  40)
(1, 40, 50)
(2, 50, 60)
(3, 60, 70)
(4, 70, 80)
(5, 80, 32767)
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