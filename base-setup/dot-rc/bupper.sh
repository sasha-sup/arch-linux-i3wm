#!/bin/bash
files_to_backup=(
    "$HOME/.vimrc"
    "$HOME/.xbindkeysrc"
    "$HOME/.xinitrc"
)

backup_dir="/home/sasha/Code/my-projects/arch-dwm/base-setup/dot-rc"

for file_path in "${files_to_backup[@]}"; do
    if [ -f "$file_path" ]; then
        file_name=$(basename "$file_path")
        backup_file="$backup_dir/${file_name}"
        cp "$file_path" "$backup_file"
    fi
done
