#!/usr/bin/bash

# Set USER if it's empty (fallback to whoami)
if [ -z "$USER" ]; then
  USER=$(whoami)
fi

if [ -z "$USER" ]; then
  echo "USER is empty, exiting"
  exit 1
fi

#--------------PREREQUISITES-------------
systemctl enable --user pipewire.service
systemctl enable --user pipewire-pulse.service

rm /home/$USER/.config/brave-flags.conf
ln -s /home/$USER/simple-hyprland/configs/brave/brave-flags.conf /home/$USER/.config/

#--------------HYPR-------------
rm -rf /home/$USER/.config/hypr
ln -s /home/$USER/simple-hyprland/configs/hypr /home/$USER/.config/
# cp /home/$USER/simple-hyprland/configs/hypr/hyprland-user.conf.tmpl /home/$USER/simple-hyprland/configs/hypr/hyprland-user.conf

rm -rf /home/$USER/.config/dunst
ln -s /home/$USER/simple-hyprland/configs/dunst /home/$USER/.config/

#--------------UTILITIES-------------
rm -rf /home/$USER/.config/waybar
ln -s /home/$USER/simple-hyprland/configs/waybar /home/$USER/.config/

rm -rf /home/$USER/.config/fuzzel
ln -s /home/$USER/simple-hyprland/configs/fuzzel /home/$USER/.config/fuzzel

rm -rf /home/$USER/.config/assets
mkdir /home/$USER/.config/assets
ln -s /home/$USER/simple-hyprland/assets/backgrounds /home/$USER/.config/assets/

rm -rf /home/$USER/.config/wlogout
ln -s /home/$USER/simple-hyprland/configs/wlogout /home/$USER/.config/
ln -s /home/$USER/simple-hyprland/assets/wlogout /home/$USER/.config/assets/
rm -rf /home/$USER/simple-hyprland/configs/wlogout/style.css
cp /home/$USER/simple-hyprland/configs/wlogout/style.css.tmpl /home/$USER/simple-hyprland/configs/wlogout/style.css
sed -i "s|_HOME_|$HOME|g" /home/$USER/simple-hyprland/configs/wlogout/style.css

rm -rf /home/$USER/.config/nvim
ln -s /home/$USER/simple-hyprland/configs/nvim /home/$USER/.config/nvim

#--------------THEMING-------------
rm -rf /home/$USER/.config/kitty
ln -s /home/$USER/simple-hyprland/configs/kitty /home/$USER/.config/
