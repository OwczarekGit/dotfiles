#!/bin/bash

echo "This script will install my DWM build. If you wish to cancel CTRL+C now."
sleep 5

# Install git.
sudo pacman -Syy
sudo pacman -S --noconfirm git

# Download build and install DWM.
git clone "https://github.com/OwczarekGit/dwm.git" dwm
cd dwm
sudo make clean install && echo "DWM is now installed."



