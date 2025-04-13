#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ASK_CONFIRM="yes"
if [[ "$1" == "--fast" ]]; then
  ASK_CONFIRM="no"
fi

# Source helper file
source $SCRIPT_DIR/helper.sh

log_message "Installation for bluetooth utils"
print_info "\nInstallation for bluetooth utils..."

run_command "pacman -S bluez bluez-utils" "Install bluetooth utils" $ASK_CONFIRM "yes"
run_command "pacman -S pipewire-audi" "To handle bluetooth audio devices" $ASK_CONFIRM "yes"
run_command "systemctl enable bluetooth.service" "Run bluetooth services" $ASK_CONFIRM "yes"
run_command "yay -S bluetui" "Install bluetooth TUI" $ASK_CONFIRM "no"
