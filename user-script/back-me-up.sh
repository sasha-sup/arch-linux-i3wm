#!/bin/bash

BASE_DIR="$HOME/Code/studies/arch-i3wm-bup"
CONF_DIR="$HOME/.config"
DATE=$(date +"%Y-%m-%d")

declare -A CONFIG_FILES=(
    ["$CONF_DIR/i3status/config"]="i3status_config_backup"
    ["$CONF_DIR/i3/config"]="i3_config_backup"
    ["$CONF_DIR/dolphinrc"]="dolphinrc_backup"
    ["$CONF_DIR/terminator/config"]="terminator_config_backup"
    ["$HOME/.bashrc"]="bashrc_backup"
    ["$HOME/.pgpass"]="pgpass_backup"
    ["$CONF_DIR/ksnip/ksnip.conf"]="ksnip_config_backup"
    ["/etc/thinkfan.conf"]="thinkfan_conf_backup"
    ["/etc/iptables/iptables.rules"]="iptables_backup"
    [$HOME/.ssh/config]="ssh_conf_backup"
)

for config_file in "${!CONFIG_FILES[@]}"; do
    config_name=$(basename "$config_file")
    backup_name="${CONFIG_FILES[$config_file]}_$DATE"
    cp "$config_file" "$BASE_DIR/$backup_name"
done

crontab -l > "$BASE_DIR/crontab_backup_$DATE.txt"
find "$BASE_DIR/" -type f -name "*_*" -mtime +7 -exec rm {} \;


send_telegram_message() {
    local message="$1"
    curl -s -X POST "https://api.telegram.org/bot$BOT_TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID" \
        -d "text=$message"
}

source /home/sasha/Code/ping-me-up/.env
message+="###
Local config files backuped
###"
send_telegram_message "$message"