# 不可直接运行，显卡不同则驱动不同，后续一些措施也不同。因为b站和火狐在硬解时相性不好，所以迁移到了chromium。

# intel。有些地方推荐不安装x86-video-intel驱动，而是使用默认的驱动（无需安装）；我在使用中也发现KDE确实和x86-video-intel不兼容，后面给出了解决方案（退回modesetting）。但我对这个名字有好感，所以还是安装了。我用不上OpenGL，所以不装mesa。
sudo pacman -S xf86-video-intel
# 安装intel-gpu-tools，使用intel_gpu_top来监视显卡工作情况

# nvidia
sudo pacman -S nvidia

# AMD
# 我在首次安装AMD显卡时，总是会在打开Chromium等时候突然卡死，于是我尝试在/etc/defaults/grub里面添加pcie_aspm=off，最后bug消失了，但不一定是由这个改动引起的。

# 桌面，字体，文件管理器，终端，浏览器，音量调节，播放器，FTP软件，截屏软件，图片查看器
sudo pacman -S plasma sddm xorg-server wqy-microhei noto-fonts-emoji dolphin konsole chromium alsa-utils vlc filezilla xfce4-screenshooter nomacs

# 使用 alsamixer 可以解除声卡的静音：
# $ alsamixer
# 声道下方标有 MM 表示其已经静音，而标有 00 表示已经启用。
# 使用 ← 和 → 键滚动到 Master 和 PCM 声道，按下 m 键解除静音。
# 使用 ↑ 键增加音量，获得0dB的增益。增益值可在左上方 Item: 字段旁边看到。

sudo mkdir -p /etc/sddm.conf.d
# 我的用户名为sakura
echo "[Autologin]
User=sakura
Session=plasma.desktop" | sudo tee -a  /etc/sddm.conf.d/autologin.conf
sudo systemctl enable sddm.service
sudo systemctl start sddm.service

# 开启浏览器视频硬解
# intel，Broadwell以及之后的核显，使用va-api
# 检查配置使用libva-utils提供的vainfo
sudo pacman -S intel-media-driver libva-utils

# nvidia，使用vdpau
# 检查配置使用vdpauinfo提供的vdpauinfo
sudo pacman -S nvidia-utils vdpauinfo

# chromium配置
# 适配wayland
echo '--ozone-platform=wayland --enable-wayland-ime ' >> ~/.config/chromium-flags.conf
# 配置太复杂了，在我的电脑上只需要下面这一句就能硬解avc了，但无论如何都解不了av1。详见arch wiki的chromium页。
echo '--disable-features=UseChromeOSDirectVideoDecoder' >> ~/.config/chromium-flags.conf

# intel监控硬解，命令是intel_gpu_top。nvidia使用nvidia-smi就行了
sudo pacman -S intel-gpu-tools

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
