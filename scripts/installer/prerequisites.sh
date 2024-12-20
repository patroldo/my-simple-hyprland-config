#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for prerequisites section"
print_info "\nStarting prerequisites setup..."

run_command "pacman -Syyu --noconfirm" "Update package database and upgrade packages (Recommended)" "yes" # no

if run_command "pacman -S --noconfirm --needed git base-devel" "Install YAY (Must)/Breaks the script" "yes"; then #
  run_command "git clone https://aur.archlinux.org/yay.git && cd yay" "Clone YAY (Must)/Breaks the script" "no" "no"
  run_command "makepkg --noconfirm -si && cd .. # builds with makepkg" "Build YAY (Must)/Breaks the script" "no" "no"
fi
run_command "pacman -S --noconfirm pipewire pipewire-pulse pipewire-alsa wireplumber" "Configuring audio (Recommended)" "yes"

run_command "systemctl enable --user pipewire.service && systemctl enable --user pipewire-pulse.service" "Configuring audio (Recommended)" "no" "no"

run_command "pacman -S --noconfirm ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-firacode-nerd ttf-iosevka-nerd ttf-iosevkaterm-nerd ttf-jetbrains-mono-nerd ttf-jetbrains-mono ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono" "Installing Nerd Fonts and Symbols (Recommended)" "yes"

run_command "pacman -S --noconfirm sddm && systemctl enable sddm.service" "Install and enable SDDM (Recommended)" "yes"

run_command "pacman -S --noconfirm chromium" "Install Chromium Browser" "yes"
run_command "ln -s /home/$SUDO_USER/simple-hyprland/configs/chromium/chromium-flag.conf /home/$SUDO_USER/.config/" "Link Chromium config file to use wayland by default" "no" "no"

run_command "pacman -S --noconfirm kitty" "Install Kitty (Recommended)" "yes"

run_command "pacman -S --noconfirm vim" "Install vim" "yes"

run_command "pacman -S --noconfirm tar" "Install tar for extracting files (Must)/needed for copying themes" "yes"

run_command "pacman -S --noconfirm sed" "Install sed(required)" "yes"

echo "------------------------------------------------------------------------"
