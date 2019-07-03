echo "# Formating Hard Disk Partitions..."
mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3
mkswap /dev/sda4
swapon /dev/sda4

echo "# Mounting Partitions..."
mount /dev/sda2 /mnt
mkdir /mnt/home
mkdir /mnt/arch_ins
mount /dev/sda3 /mnt/home
lsblk

echo "# Setting Asia/Dhaka as Timezone..."
timedatectl set-timezone Asia/Dhaka

echo "# Setting Network Time Provider.."
timedatectl set-ntp true

echo "# Installing Base and Development Packages..."
pacstrap -i /mnt base base-devel

echo "# Creating FSTAB Entries..."
genfstab -U /mnt >> /mnt/etc/fstab

echo "# Copying Post-Installation Scripts in /arch_ins ..."
cp * /mnt/arch_ins/
chmod +x *.sh
cp hosts /mnt/etc/hosts

echo "## NOW YOU CAN CHROOT IN YOUR NEWLY DEPLOYED ARCH ENVIRONMENT USING arch-chroot /mnt"
echo "Dont Forget to RUN post_ins script..."


