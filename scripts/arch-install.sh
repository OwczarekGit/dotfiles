#!/bin/bash

#
# This script is a half-assed installation script for Arch Linux with many assumptions and it's meant to be configured before it's run.
# To use it - boot arch iso and run: $curl -O https://raw.githubusercontent.com/OwczarekGit/dotfiles/refs/heads/master/scripts/arch-install.sh
# Then edit with desired modifications (remember to remove exit line) it ex. vim arch-install.sh, run afterwards ./arch-install.sh.
#

echo "!!! CONFIGURE THIS SCRIPT AND THEN REMOVE EXIT BELOW !!!"
exit

set -xe

# Disk to install the system.
D=

D1="$D"1
D2="$D"2
M=/mnt

HOSTNAME=

# Set those, PASS is same for root and USER.
USER=
PASS=

# As i said a lot of assumptions.
EN=en_US.UTF-8
PL=pl_PL.UTF-8

# Partition
sgdisk -Z $D
sgdisk -o $D
sgdisk -n 1:2048:1G -t 1:ef00 $D
sgdisk -N 2 -t 1:8300 $D

# Format
mkfs.fat -F32 $D1
mkfs.btrfs -v -f $D2

# Prepare subvolumes
mount $D2 $M
btrfs subvolume create $M/{@,@home}
umount $M

# Mount partitions
mount -o compress=zstd:15,subvol=@ $D2 $M
mkdir $M/{home,boot}
mount -o compress=zstd:15,subvol=@home $D2 $M/home
mount $D1 $M/boot

# Install base system
pacstrap -K $M base base-devel linux linux-{headers,firmware} efibootmgr fish zellij neovim helix networkmanager git nushell btrfs-progs dosfstools intel-ucode less htop mc exfatprogs ntfs-3g fuse fuse2 fuse3 sshfs rsync man tealdeer xdg-user-dirs openssh archlinux-keyring bluez bluez-{tools,utils}

# Genfstab
genfstab -U $M > $M/etc/fstab

# Basic configuration
arch-chroot $M echo -e "$PASS\n$PASS" | passwd root -s
arch-chroot $M sed -i "s/#$EN/$EN/;s/#$PL/$PL/" /etc/locale.gen

arch-chroot $M bash -c "echo \"LANG=$EN\"               > /etc/locale.conf"
arch-chroot $M bash -c "echo \"LC_NUMERIC=$PL\"        >> /etc/locale.conf"
arch-chroot $M bash -c "echo \"LC_TIME=$PL\"           >> /etc/locale.conf"
arch-chroot $M bash -c "echo \"LC_MONETARY=$PL\"       >> /etc/locale.conf"
arch-chroot $M bash -c "echo \"LC_PAPER=$PL\"          >> /etc/locale.conf"
arch-chroot $M bash -c "echo \"LC_NAME=$PL\"           >> /etc/locale.conf"
arch-chroot $M bash -c "echo \"LC_ADDRESS=$PL\"        >> /etc/locale.conf"
arch-chroot $M bash -c "echo \"LC_TELEPHONE=$PL\"      >> /etc/locale.conf"
arch-chroot $M bash -c "echo \"LC_MEASUREMENT=$PL\"    >> /etc/locale.conf"
arch-chroot $M bash -c "echo \"LC_IDENTIFICATION=$PL\" >> /etc/locale.conf"

arch-chroot $M bash -c "echo \"KEYMAP=pl\" > /etc/vconsole.conf"
arch-chroot $M locale-gen

arch-chroot $M sed -i "s/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/" /etc/sudoers
# TODO: enable multilib.

arch-chroot $M ln -sf /usr/share/zoneinfo/Europe/Warsaw /etc/localtime
arch-chroot $M bash -c "echo $HOSTNAME > /etc/hostname"

arch-chroot $M bash -c "echo MOZ_ENABLE_WAYLAND=1 >> /etc/environment"
arch-chroot $M bash -c "echo EDITOR=nvim >> /etc/environment"

# Boot loader
arch-chroot $M bootctl install

arch-chroot $M bash -c "echo \"default arch.conf\" > /boot/loader/loader.conf"
arch-chroot $M bash -c "echo \"timeout 3\" >> /boot/loader/loader.conf"
arch-chroot $M bash -c "echo \"editor yes\" >> /boot/loader/loader.conf"
arch-chroot $M bash -c "echo \"console_mode max\" >> /boot/loader/loader.conf"

arch-chroot $M bash -c "echo \"title Arch Linux\" > /boot/loader/entries/arch.conf"
arch-chroot $M bash -c "echo \"linux /vmlinuz-linux\" >> /boot/loader/entries/arch.conf"
arch-chroot $M bash -c "echo \"initrd /intel-ucode.img\" >> /boot/loader/entries/arch.conf"
arch-chroot $M bash -c "echo \"initrd /initramfs-linux.img\" >> /boot/loader/entries/arch.conf"
arch-chroot $M bash -c "echo \"options root=$(blkid -o export $D2 | head -n2 | tail -n1) rw rootflags=subvol=@\" >> /boot/loader/entries/arch.conf"

# Post install packages
arch-chroot $M pacman -Syyu --noconfirm --needed wireplumber pipewire pipewire-{pulse,jack,alsa} cosmic vulkan-icd-loader vulkan-radeon mpv ffmpeg yt-dlp noto-fonts-{cjk,emoji} flatpak xdg-desktop-portal-gtk firefox lazygit fastfetch upower tuned tuned-ppd docker docker-compose virtualbox virtualbox-host-modules-arch libnotify wl-clipboard

# Start services
arch-chroot $M systemctl enable sshd cosmic-greeter tuned tuned-ppd NetworkManager avahi-daemon bluetooth

# User configuration
arch-chroot $M useradd -m -s /usr/bin/nu -g users -G wheel,power,storage,floppy,optical,input,docker,vboxusers $USER
arch-chroot $M bash -c "echo -e \"$PASS\n$PASS\" | passwd $USER -s"

# Finalization
arch-chroot $M sync
sync
echo "DONE: Now you can reboot."
