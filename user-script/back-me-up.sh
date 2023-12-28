#!/bin/bash

BASE_DIR="$HOME/Code/studies/arch-i3wm-bup"
CONF_DIR="$HOME/.config"
DATE=$(date +"%Y-%m-%d")


declare -a CONFIG_FILES=(
    "$CONF_DIR/i3status/config"
    "$CONF_DIR/i3/config"
    "$CONF_DIR/dolphinrc"
    "$CONF_DIR/terminator/config"
    "$HOME/.bashrc"
    "$HOME/.pgpass"
    "$CONF_DIR/ksnip/ksnip.conf"
    "/etc/tlp.conf"
    "/etc/thinkfan.conf"
)

for config_file in "${CONFIG_FILES[@]}"; do
    config_name=$(basename "$config_file")
    backup_name="$config_name"_"$DATE"
    cp "$config_file" "$BASE_DIR/$backup_name"
done

crontab -l > "$BASE_DIR/crontab_backup_$DATE.txt"
find "$BASE_DIR/" -type f -name "*_*" -mtime +7 -exec rm {} \;
