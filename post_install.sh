#!/bin/bash

# Warning
echo "This script should be run as root after running arch-chroot."
echo "If you don't meet that requirement please CTRL+C now, else wait couple seconds."
sleep 5

# Create and setup user.
echo "Please specify your user name:"
read user
useradd -m -s /usr/bin/fish -g users -G wheel,power,storage,optical,input,floppy $user

# Set the password for user and root
echo "Set the password for user:"
passwd $user

echo "Set the password for root:"
passwd

# Set the hostname.
echo "Please provide the hostname:"
read hostname
echo "$hostname" > /etc/hostname

# Installing paru aur helper.
pacman -S git --noconfirm
git clone "https://aur.archlinux.org/paru-bin.git"
cd paru-bin && makepkg -si

# Set the locale to the one i prefer.
cp locale.conf /etc/locale.conf
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "pl_PL.UTF-8 UTF-8" >> /etc/locale.gen
echo "KEYMAP=pl" > /etc/vconsole.conf

echo 'MAKEFLAGS="-j4"' >> /etc/makepkg.conf

echo 'Color' >> /etc/pacman.conf
echo "ParallelDownloads = 20" >> /etc/pacman.conf

echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

echo "BottomUP" >> /etc/paru.conf

# Enable system services.
systemctl enable NetworkManager bluetooth tlp

# Enable user services.
systemctl enable --user pipewire-pulse pipewire
