#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ASK_CONFIRM="yes"
if [[ "$1" == "--fast" ]]; then
  ASK_CONFIRM="no"
fi

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for theming section"
print_info "\nStarting theming setup..."

run_command "yay -S --sudoloop --noconfirm kvantum-theme-catppuccin-git" "Install Catppuccin theme for Kvantum" $ASK_CONFIRM "no"

run_command "ln -s /home/$SUDO_USER/simple-hyprland/configs/kitty /home/$SUDO_USER/.config/" "Copy Catppuccin theme configuration for Kitty terminal" $ASK_CONFIRM "no"
