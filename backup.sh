#!/bin/bash

# 定义源目录和目标目录
source_dirs=("$HOME/.config/sway" "$HOME/.config/hypr" "$HOME/.config/waybar" "$HOME/.config/waync" "$HOME/.config/rofi")
target_root_dir="$(dirname "${BASH_SOURCE[0]}")/config"

# Check if target root directory exists, if not, create it
if [ ! -d "$target_root_dir" ]; then
    echo "Target root directory $target_root_dir does not exist, creating..."
    mkdir -p "$target_root_dir"
fi

# Loop through each source directory for backup
for source_dir in "${source_dirs[@]}"; do
    # Extract target directory name
    target_dir="${target_root_dir}/$(basename "$source_dir")"

    # Check if source directory exists
    if [ ! -d "$source_dir" ]; then
        echo "Source directory $source_dir does not exist."
        continue
    fi

    # Check if target directory exists, if not, create it
    if [ ! -d "$target_dir" ]; then
        echo "Target directory $target_dir does not exist, creating..."
        mkdir -p "$target_dir"
    fi

    # Backup source directory to target directory
    echo "Backing up $source_dir to $target_dir ..."
    cp -r "$source_dir"/* "$target_dir"
    echo "Backup completed."
done