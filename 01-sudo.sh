# 这一步应该在安装Arch Linux操作系统时就完成
# 当前用户应为root
# 假设用户名为sakura
pacman -S sudo
echo "sakura ALL=(ALL) ALL" >> /etc/sudoers