# 这一步应该在安装Arch Linux操作系统时就完成
# 后续如果出现和中文有关的问题，都有可能是locale没有设置好
sudo sed -i "s|#zh_CN.UTF-8 UTF-8|zh_CN.UTF-8 UTF-8|" /etc/locale.gen
sudo sed -i "s|#en_US.UTF-8 UTF-8|en_US.UTF-8 UTF-8|" /etc/locale.gen
sudo locale-gen
echo "LANG=en_US.UTF-8" | sudo tee /etc/locale.conf

# 如果/etc/locale.conf和konsole中的locale输出结果不一致，可能是kde的设置覆盖了konsole的值，删去~/.config/plasma-localerc后重启