sudo pacman -S lsof base-devel
# git clone -> makepkg -> pacman -U -> rm是AUR包基本的操作
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin
makepkg
sudo pacman -U *.zst
cd ..
rm -r visual-studio-code-bin