# .bashrc和.bash_profile都调用同一个.bash_inside文件，使得无论是通过tty还是terminal还是ssh，情况都一致。后续如果有conda init等写入.bashrc的情况，请手动把.bashrc里的东西复制到.bash_inside里面，然后保证.bashrc里只有source ~/.bash_inside一条命令
# 每天想起来就运行syu，滚动更新系统
echo 'alias syu="sudo pacman -Syu"' >> ~/.bash_inside
echo 'source ~/.bash_inside' >> ~/.bashrc
echo 'source ~/.bash_inside' >> ~/.bash_profile
source ~/.bash_inside
syu

# 安装这个包，然后定期运行sudo paccache -r清除缓存
sudo pacman -S pacman-contrib
# sudo paccache -r

# 用于建立索引，使用locate快速查找文件
sudo pacman -S mlocate
# sudo updatedb