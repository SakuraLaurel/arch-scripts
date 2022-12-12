# 很早的时候就配置好ssh，就可以通过ssh配置其他项，复制粘贴会方便很多
sudo pacman -S openssh
sudo systemctl enable sshd.service
sudo systemctl start sshd.service

# 修改端口为19810，提高安全性。也可以不修改。
sudo sed -i "s|#Port 22|Port 19810|" /etc/ssh/sshd_config
sudo systemctl restart sshd.service