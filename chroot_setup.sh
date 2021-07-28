#!/bin/bash

# Warning
echo "This script should be run as root after running arch-chroot."
echo "If you don't meet that requirement please CTRL+C now, else wait couple seconds."
sleep 5

# Setup ntp and stuff.
timedatectl set-ntp true
hwclock --systohc

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
pacman -Syy
pacman -S git pipewire-pulse pipewire pipewire-alsa pipewire-jack bluez networkmanager tlp--noconfirm

# Set the locale to the one i prefer.
ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime

cp   "./locale.conf" "/etc/locale.conf"
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "pl_PL.UTF-8 UTF-8" >> /etc/locale.gen
echo "KEYMAP=pl" > /etc/vconsole.conf
echo "a4" >> /etc/papersize

#sed  'MAKEFLAGS="-j4"' >> /etc/makepkg.conf

sed -i "s/#Color/Color/g; s/#ParallelDownloads = 5/ParallelDownloads = 20/g" /etc/pacman.conf

sed -i 's/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL/g' /etc/sudoers

echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

#echo "BottomUP" >> /etc/paru.conf

# Enable system services.
systemctl enable NetworkManager bluetooth tlp

# Enable user services.
systemctl enable --user pipewire-pulse pipewire

echo "Done now install boot loader, reboot, and run post_reboot script."
