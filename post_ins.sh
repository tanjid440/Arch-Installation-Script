echo "# Setting Asia/Dhaka as Timezone..."
ln -sf /usr/share/zoneinfo/Asia/Dhaka /etc/localtime

echo "# Setting HW Clock..."
hwclock --systohc

echo "## Uncomment needed localizations.."
vim /etc/locale.gen

echo "# Genarating Localizations..."
locale-gen

echo "# Creating Localization File..."
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "# Setting Hostname: tanzo"
echo tanzo > /etc/hostname

echo "# Creating HOSTS File..."
vim /etc/hosts

echo "## Set a new password for ROOT user..."
clear
passwd

echo "# Installing GRUB and EFI Packages..."
pacman -Syu grub efibootmgr

echo "# Creating EFI Directories..."
mkdir -p /boot/efi
mount /dev/sda1 /boot/efi

echo "# Installing GRUB and Configuring for UEFI Mode..."
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi

echo "# Generating GRUB Config..."
grub-mkconfig -o /boot/grub/grub.cfg

echo "# Configuring additional EFI scripts..."
mkdir /boot/efi/EFI/BOOT
cp /boot/efi/EFI/GRUB/grubx64.efi /boot/efi/EFI/BOOT/BOOTX64.EFI
cp startup.nsh /boot/efi/startup.nsh

echo "## Now exit, umount and shutdown the device then remove the Installation media..."
echo "## Then on your new system login as ROOT and RUN fnl_ins.sh to finalize your installation ..."
