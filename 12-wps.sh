paru wps-office ttf-wps-fonts wps-office-mui-zh-cn libtiff5

# git clone https://aur.archlinux.org/wps-office.git
# cd wps-office
# makepkg
# sudo pacman -U *.zst
# cd ..
# rm -r wps-office

# # 安装专用字体，否则可能导致ppt乱码
# git clone https://aur.archlinux.org/ttf-wps-fonts.git
# cd ttf-wps-fonts
# makepkg
# sudo pacman -U *.zst
# cd ..
# rm -r ttf-wps-fonts

# # 如果需要中文化，注意只需要安装wps-office-mui-zh-cn
# git clone https://aur.archlinux.org/wps-office-cn.git
# cd wps-office-cn
# makepkg
# sudo pacman -U wps-office-mui-zh-cn*.zst
# cd ..
# rm -r wps-office-cn
