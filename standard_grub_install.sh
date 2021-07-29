#!/bin/bash

echo "This script should be run as root after 'chroot_setup.sh' and is optional."
echo "If you want to use different boot loader CTRL+C now. Else wait."
sleep 5

# Install grub
pacman -Syy
pacman -S --noconfirm grub efibootmgr

# Get targer drive for BIOS boot.
echo "Install grub to drive? Provide format like: '/dev/sda' etc."
read disk

# Install grub
grub-install --target=i386-pc --boot-directory=/boot --efi-directory=/boot --removable $disk
grub-install --target=x86_64-efi --boot-directory=/boot --efi-directory=/boot --removable

# Generate config
grub-mkconfig -o /boot/grub/grub.cfg

# Done!
echo "Done you may now reboot!"
