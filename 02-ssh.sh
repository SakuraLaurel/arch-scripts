# 很早的时候就配置好ssh，就可以通过ssh配置其他项，复制粘贴会方便很多
sudo pacman -S openssh
sudo systemctl enable sshd.service
sudo systemctl start sshd.service

# 允许远程连接时添加-X选项，显示图形化界面。后来我才知道，后缀名为.service时可以不加。
sudo sed -i "s|#X11Forwarding no|X11Forwarding yes|" /etc/ssh/sshd_config
sudo systemctl restart sshd

# 修改端口为19810，提高安全性。也可以不修改。
sudo sed -i "s|#Port 22|Port 19810|" /etc/ssh/sshd_config
sudo systemctl restart sshd.service

# 使用Matlab过程中遇到的问题：
# 主要排查方式是运行`matlab/bin/glnxa64/MATLABWindow`，处理报错
# 第一条报错：...matlab/bin/glnxa64/libtiff.so.5: version `LIBTIFF_4.0' not found (required by /usr/lib/libgdk_pixbuf-2.0.so.0)
# 查了一下github等，认为是libtiff不兼容。处理方法是删掉（后面详述）libtiff.so.*
# 第二条报错：...matlab/bin/glnxa64/MATLABWindow: symbol lookup error: /usr/lib/libharfbuzz.so.0: undefined symbol: FT_Get_Transform
# 查了一下arch wiki，认定“FT”不是傅里叶变换，而是freetype2包的freetype的意思，同样出现了不兼容问题。删去对应的链接库。
# 删去方法：在glnxa64下新建文件夹exclude，然后
# mv libtiff.so.* exclude/
# mv libfreetype.so* exclude/