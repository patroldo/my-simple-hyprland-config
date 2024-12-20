#!/bin/bash

run_command "pacman -S bluez bluez-utils" "Install bluetooth utils" "yes" "yes"
run_command "systemctl enable bluetooth.service" "Run bluetooth services" "no" "yes"
run_command "yay -S bluetui" "Install bluetooth terminal UI" "yes" "no"
