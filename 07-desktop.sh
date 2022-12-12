# 不可直接运行，显卡不同则驱动不同，后续一些措施也不同
# intel。后续可能还要安装intel-media-driver等包来开启硬件视频加速等功能
sudo pacman -S xf86-video-intel
# 安装intel-gpu-tools，使用intel_gpu_top来监视显卡工作情况
# nvidia。同样可能需要安装nvidia-utils等包
sudo pacman -S nvidia

sudo pacman -S xorg-server plasma sddm
sudo pacman -S dolphin firefox-i18n-zh-cn konsole wqy-microhei noto-fonts-emoji vlc feh filezilla
sudo mkdir -p /etc/sddm.conf.d
# 我的用户名为sakura
echo "[Autologin]
User=sakura
Session=plasma.desktop" | sudo tee -a  /etc/sddm.conf.d/autologin.conf
sudo systemctl enable sddm.service
sudo systemctl start sddm.service

# Intel GPU
echo 'Section "Device"
  Identifier "Intel Graphics"
  Driver "modesetting"
EndSection' | sudo tee -a /etc/X11/xorg.conf.d/20-intel.conf

# Nvidia GPU
sudo sed -i 's|GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet"|GRUB_CMDLINE_LINUX_DEFAULT="loglevel=3 quiet ibt=off"|' /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg

reboot

# 不自动锁屏
# 系统设置->工作区行为->锁屏

# 设置关闭桌面的快捷键
# 系统设置 > 硬件 > 输入设备 > 键盘 > 高级（标签） > "Key Sequence to kill the X server" 

# SDDM旋转
# monitor=显示器名字，left表示旋转方向
# echo "xrandr --output $monitor --rotate left" >> /usr/share/sddm/scripts/Xsetup

# numlock键
# KDE：系统设置->输入设备->键盘->Hardware->Turn on->应用
# tty：
echo '#!/bin/bash

for tty in /dev/tty{1..6}
do
    /usr/bin/setleds -D +num < "$tty";
done' | sudo tee /usr/local/bin/numlock
sudo chmod a+x /usr/local/bin/numlock
echo '[Unit]
Description=numlock

[Service]
ExecStart=/usr/local/bin/numlock
StandardInput=tty
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target' | sudo tee /etc/systemd/system/numlock.service
sudo systemctl enable /etc/systemd/system/numlock.service