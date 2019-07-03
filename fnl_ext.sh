echo "# Installing YAY as AUR Helper..."
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

echo "# Finalizing GPU Driver installation..."
yay -S libva-intel-driver-g45-h264 intel-hybrid-codec-driver libva-intel-driver-g45-h264 mpv-git ffmpeg-git

echo "## Now you can reboot..."
