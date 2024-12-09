#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for hypr section"
print_info "\nStarting hypr setup..."
print_info "\nEverything is recommended to INSTALL"

run_command "pacman -S --noconfirm hyprland" "Install Hyprland (Must)" "yes"
run_command "ln -s /home/$SUDO_USER/simple-hyprland/configs/hypr /home/$SUDO_USER/.config/" "Link Hyprland config" "yes" "no"

run_command "pacman -S --noconfirm xdg-desktop-portal-hyprland" "Install XDG desktop portal for Hyprland" "yes"

run_command "pacman -S --noconfirm polkit-kde-agent" "Install KDE Polkit agent for authentication dialogs" "yes"
run_command "pacman -S --noconfirm nautilus" "Install Nautilus(file manager)" "yes"

run_command "pacman -S --noconfirm dunst libnotify" "Install Dunst notification daemon" "yes"
run_command "ln -s /home/$SUDO_USER/simple-hyprland/configs/dunst /home/$SUDO_USER/.config/" "Copy dunst config" "yes" "no"

run_command "pacman -S --noconfirm qt5-wayland qt6-wayland" "Install QT support on wayland" "yes"

echo "------------------------------------------------------------------------"
