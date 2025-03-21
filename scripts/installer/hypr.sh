#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ASK_CONFIRM="yes"
if [[ "$1" == "--fast" ]]; then
  ASK_CONFIRM="no"
fi

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for hypr section"
print_info "\nStarting hypr setup..."
print_info "\nEverything is recommended to INSTALL"

run_command "pacman -S --noconfirm hyprland" "Install Hyprland (Must)" $ASK_CONFIRM
run_command "yay -S --sudoloop --noconfirm uwsm" "Install UWSM to start Hyprland (Must)" $ASK_CONFIRM "no"
run_command "yay -S --sudoloop --noconfirm hyprland-qtutils --overwrite '*'" "Install hyprland utils(recommended by hyprland)" $ASK_CONFIRM "no"
run_command "ln -s /home/$SUDO_USER/simple-hyprland/configs/hypr /home/$SUDO_USER/.config/" "Link Hyprland config" $ASK_CONFIRM "no"
run_command "cp /home/$SUDO_USER/simple-hyprland/configs/hypr/hyprland-user.conf.tmpl /home/$SUDO_USER/simple-hyprland/configs/hypr/hyprland-user.conf" "Create user-specifc hyprland config" $ASK_CONFIRM "no"

run_command "pacman -S --noconfirm xdg-desktop-portal-hyprland" "Install XDG desktop portal for Hyprland" $ASK_CONFIRM

run_command "pacman -S --noconfirm polkit-kde-agent" "Install KDE Polkit agent for authentication dialogs" $ASK_CONFIRM
run_command "pacman -S --noconfirm nautilus" "Install Nautilus(file manager)" $ASK_CONFIRM

run_command "pacman -S --noconfirm dunst libnotify" "Install Dunst notification daemon" $ASK_CONFIRM
run_command "ln -s /home/$SUDO_USER/simple-hyprland/configs/dunst /home/$SUDO_USER/.config/" "Copy dunst config" $ASK_CONFIRM "no"

run_command "pacman -S --noconfirm qt5-wayland qt6-wayland" "Install QT support on wayland" $ASK_CONFIRM

echo "------------------------------------------------------------------------"
