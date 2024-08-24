# 已经不再推荐手动安装，推荐使用paru

sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si

# 修改字体，可以将设置中的Editor: Font Family修改为 'Consolas', 'Consolas', monospace, 'Consolas'

# 然后

paru visual-studio-code-bin

# sudo pacman -S lsof base-devel
# # git clone -> makepkg -> pacman -U -> rm是AUR包基本的操作
# git clone https://aur.archlinux.org/visual-studio-code-bin.git
# cd visual-studio-code-bin
# makepkg
# sudo pacman -U *.zst
# cd ..
# rm -r visual-studio-code-bin
