#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ASK_CONFIRM="yes"
if [[ "$1" == "--fast" ]]; then
  ASK_CONFIRM="no"
fi

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for utilities section"
print_info "\nStarting utilities setup..."

run_command "mkdir /home/$SUDO_USER/.config/assets" "Creating directory for assets" "no" "no"

run_command "pacman -S --noconfirm cliphist" "Install Cliphist - Clipboard Manager" $ASK_CONFIRM

run_command "yay -S --sudoloop --noconfirm swww" "Install SWWW for wallpaper management" $ASK_CONFIRM "no"
run_command "ln -s /home/$SUDO_USER/simple-hyprland/assets/backgrounds /home/$SUDO_USER/.config/assets/" "Link sample wallpapers to assets directory (Recommended)" $ASK_CONFIRM "no"

run_command "pacman -S --noconfirm neovim" "Install Neovim" $ASK_CONFIRM
run_command "ln -s /home/$SUDO_USER/simple-hyprland/configs/nvim /home/$SUDO_USER/.config/nvim" "Copy Neovim config" $ASK_CONFIRM "no"
run_command "pacman -S --noconfirm brightnessctl" "Install brightnessctl to control display brightness via hotkey" $ASK_CONFIRM
run_command "pacman -S --noconfirm keychain" "Install keychain for ssh-agent, gpg-agent and private keys" $ASK_CONFIRM
echo "------------------------------------------------------------------------"
