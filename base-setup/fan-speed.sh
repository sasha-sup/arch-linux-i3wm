#!/bin/bash
# Enable fan control
grep -q 'options thinkpad_acpi fan_control=1' /etc/modprobe.d/thinkpad_acpi.conf || echo -e "Enable fan conrol by executing --> \n echo 'options thinkpad_acpi fan_control=1' | sudo tee /lib/modprobe.d/thinkpad_acpi.conf"

# Create config file
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

echo -e "Run next with sudo:\n
echo "thinkpad_acpi" | sudo tee -a /etc/modules-load.d/thinkpad_acpi.conf\n
echo "options thinkpad_acpi fan_control=1" | sudo tee -a /etc/modprobe.d/thinkpad_acpi.conf\n
echo 'THINKFAN_ARGS="-c /etc/thinkfan.conf"' | sudo tee -a /etc/default/thinkfan\n
sudo systemctl enable thinkfan; echo "Reboot now."\n"

