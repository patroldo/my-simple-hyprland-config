#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

FAST="false"
if [[ "$1" == "--fast" ]]; then
  FAST="true"
fi

# Source helper file
source $SCRIPT_DIR/helper.sh

# Trap for unexpected exits
trap 'trap_message' INT TERM

# Script start
log_message "Installation started"
print_bold_blue "\nSimple Hyprland"
echo "---------------"

# Check if running as root
check_root

# Check if OS is Arch Linux
check_os

# Run child scripts
run_script "prerequisites.sh" "Prerequisites Setup" $FAST
run_script "hypr.sh" "Hyprland & Critical Softwares Setup" $FAST
run_script "utilities.sh" "Basic Utilities & Configs Setup" $FAST
run_script "theming.sh" "Themes and Tools Setup" $FAST
run_script "bluetooth.sh" "Bluetooth utils" $FAST
run_script "final.sh" "Final Setup" $FAST

print_bold_blue "\n🌟 Setup Complete\n"
log_message "Installation completed successfully"
