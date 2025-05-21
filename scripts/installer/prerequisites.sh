#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ASK_CONFIRM="yes"
if [[ "$1" == "--fast" ]]; then
  ASK_CONFIRM="no"
fi

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation started for prerequisites section"
print_info "\nStarting prerequisites setup..."

run_command "pacman -Syyu --noconfirm" "Update package database and upgrade packages (Recommended)" $ASK_CONFIRM # no

if run_command "pacman -S --noconfirm --needed git base-devel" "Install YAY (Must)/Breaks the script" $ASK_CONFIRM; then #
  run_command "git clone https://aur.archlinux.org/yay.git && cd yay" "Clone YAY (Must)/Breaks the script" "no" "no"
  run_command "makepkg --noconfirm -si && cd .. # builds with makepkg" "Build YAY (Must)/Breaks the script" "no" "no"
fi
run_command "pacman -S --noconfirm pipewire pipewire-pulse pipewire-alsa wireplumber" "Configuring audio (Recommended)" $ASK_CONFIRM

run_command "systemctl enable --user pipewire.service && systemctl enable --user pipewire-pulse.service" "Configuring audio (Recommended)" $ASK_CONFIRM "no"

run_command "pacman -S --noconfirm ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-firacode-nerd ttf-iosevka-nerd ttf-iosevkaterm-nerd ttf-jetbrains-mono-nerd ttf-jetbrains-mono ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono noto-fonts-emoji" "Installing Nerd Fonts and Symbols (Recommended)" $ASK_CONFIRM

run_command "pacman -S --noconfirm sddm" "Install (Recommended)" $ASK_CONFIRM
run_command "systemctl enable sddm.service" "Enable SDDM (Recommended)" $ASK_CONFIRM

run_command "yay -S --sudoloop --noconfirm brave-bin" "Install Brave Browser" $ASK_CONFIRM "no"
run_command "ln -s /home/$SUDO_USER/simple-hyprland/configs/brave/brave-flags.conf /home/$SUDO_USER/.config/" "Link Brave config file to use wayland by default" $ASK_CONFIRM "no"

run_command "pacman -S --noconfirm kitty" "Install Kitty (Recommended)" $ASK_CONFIRM

run_command "pacman -S --noconfirm vim" "Install vim" $ASK_CONFIRM

run_command "pacman -S --noconfirm tar" "Install tar for extracting files (Must)/needed for copying themes" $ASK_CONFIRM

run_command "pacman -S --noconfirm sed" "Install sed(required)" $ASK_CONFIRM

run_command "pacman -S --noconfirm linux-headers" "Install linux headers(optional, useful in the future)" $ASK_CONFIRM

echo "------------------------------------------------------------------------"
