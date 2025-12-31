#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ASK_CONFIRM="yes"
if [[ "$1" == "--fast" ]]; then
  ASK_CONFIRM="no"
fi

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for niri section"
print_info "\nStarting niri setup..."
print_info "\nEverything is recommended to INSTALL"
# sudo pacman -Syu niri xwayland-satellite xdg-desktop-portal-gnome xdg-desktop-portal-gtk alacritty
# paru -S dms-shell-bin matugen wl-clipboard cliphist cava qt6-multimedia-ffmpeg
# systemctl --user add-wants niri.service dms

run_command "pacman -S --noconfirm niri" "Install Niri (Must)" $ASK_CONFIRM
# run_command "yay -S --sudoloop --noconfirm uwsm" "Install UWSM to start Hyprland (Must)" $ASK_CONFIRM "no"
# run_command "yay -S --sudoloop --noconfirm hyprland-qtutils --overwrite '*'" "Install hyprland utils(recommended by hyprland)" $ASK_CONFIRM "no"
# run_command "ln -s /home/$SUDO_USER/simple-hyprland/configs/hypr /home/$SUDO_USER/.config/" "Link Hyprland config" $ASK_CONFIRM "no"
# run_command "cp /home/$SUDO_USER/simple-hyprland/configs/hypr/hyprland-user.conf.tmpl /home/$SUDO_USER/simple-hyprland/configs/hypr/hyprland-user.conf" "Create user-specifc hyprland config" $ASK_CONFIRM "no"

# run_command "pacman -S --noconfirm xdg-desktop-portal-hyprland" "Install XDG desktop portal for Hyprland" $ASK_CONFIRM
run_command "pacman -S --noconfirm xdg-desktop-portal-gnome" "Install GNOME desktop portal for Niri" $ASK_CONFIRM
run_command "pacman -S --noconfirm xwayland-satellite" "Install xwayland-satellite" $ASK_CONFIRM
run_command "pacman -S --noconfirm xdg-desktop-portal-gtk" "Install GTK desktop portal" $ASK_CONFIRM
run_command "yay -S --sudoloop --noconfirm dms-shell-bin" "Install Dark material shell(instead of waybar, fuzzel etc.)" $ASK_CONFIRM
run_command "yay -S --sudoloop --noconfirm matugen" "Install Dark material shell(DMS) as desktop widgets(instead of waybar, fuzzel etc.)" $ASK_CONFIRM
run_command "yay -S --sudoloop --noconfirm wl-clipboard" "Install Dark material shell(instead of waybar, fuzzel etc.)" $ASK_CONFIRM
run_command "yay -S --sudoloop --noconfirm cava" "Install Dark material shell(instead of waybar, fuzzel etc.)" $ASK_CONFIRM
run_command "yay -S --sudoloop --noconfirm qt6-multimedia-ffmpeg" "Install Dark material shell(instead of waybar, fuzzel etc.)" $ASK_CONFIRM
run_command "pacman -S --noconfirm nautilus" "Install Nautilus(file manager)" $ASK_CONFIRM
run_command "systemctl --user add-wants niri.service dms" "Enable DMS during Niri startup" $ASK_CONFIRM "yes"
run_command "ln -s /home/$SUDO_USER/simple-hyprland/configs/niri /home/$SUDO_USER/.config/" "Link Niri config" $ASK_CONFIRM "no"

echo "------------------------------------------------------------------------"
