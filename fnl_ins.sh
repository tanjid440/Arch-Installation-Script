echo "# Creating User: tanjid440"
useradd -m -g users -G wheel -s /bin/bash tanjid440

echo "## Set a password for tanjid440"
passwd tanjid440

echo "## Enable wheel group as sudo user"
echo "## Uncomment %wheel ALL=(ALL) ALL"
EDITOR=nano visudo

echo "## Add multilib repo before procceding..."
nano /etc/pacman.conf
pacman -Syu git wget

echo "# Installing Display Server and Intel GPU Driver..."
pacman -S xorg xorg-xinit
pacman -S mesa lib32-mesa xf86-video-intel vulkan-intel intel-media-driver libva-intel-driver mplayer openjpeg aom schroedinger libdv x265 x264 libde265 libmpeg2 xvidcore libvpx gst-libav gst-plugins-good gstreamer-vaapi networkmanager

echo "# Adding Final Touches..."
timedatectl set-ntp true
systemctl enable NetworkManager
cp 20-intel.conf /etc/X11/xorg.conf.d/20-intel.conf
cp .drirc /home/tanjid440/.drirc
cp fnl_ext.sh /home/tanjid440/fnl_ext.sh
chmod +x fnl_ext.sh

echo "## Logout and Login as tanjid440, then run fnl_ext.sh"
