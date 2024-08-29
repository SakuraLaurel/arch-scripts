# 本脚本不可直接运行，因为网卡的名称大概率不一致
# 开启网络服务和DNS服务
sudo systemctl enable systemd-networkd.service
sudo systemctl enable systemd-resolved.service
# 网卡名为enp3s0
# ip设置为192.168.1.254
# 子网掩码是255.255.255.0
# 网关是192.168.1.1
echo "[Match]
Name=enp3s0

[Network]
Address=192.168.1.254/24
Gateway=192.168.1.1
DNS=8.8.8.8" | sudo tee -a /etc/systemd/network/20-wired.network

sudo systemctl restart systemd-networkd.service
sudo systemctl restart systemd-resolved.service
# 避免特殊情况下DNS异常的情况。至于为什么是resolv而不是resolve，我也不知道
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

# wifi，没有无线网卡的可以略过
sudo pacman -S iwd
sudo systemctl enable iwd.service
sudo systemctl start iwd.service
sudo iwctl
# device list 查看可用设备，这里是wlan0
# station wlan0 scan 扫描Wi-Fi
# station wlan0 get-networks 查看可用Wi-Fi
# 我的Mercury UD13H网卡是MT7612U，卸载之后就可以读取出来，卸载前则是可移动磁盘。
# wifi名为NAIVE
station wlan0 connect NAIVE
# ctrl+d 退出

echo "[Match]
Name=wlan0

[Network]
Address=192.168.1.251/24
Gateway=192.168.1.1
DNS=8.8.8.8"  | sudo tee -a /etc/systemd/network/25-wireless.network
sudo systemctl restart systemd-networkd.service
sudo systemctl restart systemd-resolved.service

# 使蓝牙可用
sudo pacman -S bluez bluez-utils
# 使一些自带驱动的windows usb网卡可以在linux上即插即用，无需挂载弹出
sudo pacman -S usb_modeswitch
