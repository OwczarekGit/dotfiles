#!/bin/bash

echo "This script has to be run after first reboot and logging in as standard user."
echo "I you don't meet these requirements please CTRL+C now, wait a second otherwise."
sleep 5

# Installing programs
git clone "https://aur.archlinux.org/paru-bin.git"
cd paru-bin && makepkg -si && cd ..
sudo sed -i 's/#BottomUp/BottomUp/g' "/etc/paru.conf"

paru -Syyu
paru -S $(cat "minimal/packs.pacman") --noconfirm


# Copying config files
cp -r ./minimal/.* "$HOME/"

# Done 
echo "Done! Now you can setup your WM of choice."
echo "If you wish to install my DWM run: 'git clone \"https://github.com/OwczarekGit/dwm.git\"'"

