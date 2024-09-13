# 本脚本（不）可直接运行，因为缺少配置文件
sudo pacman -S clash screen
# 复制配置文件为~/.config/clash/config.yaml，配置文件未在此仓库中给出
echo 'alias proxy-on="export https_proxy=\"http://127.0.0.1:7890\" && export http_proxy=\"http://127.0.0.1:7890\""
alias proxy-off="unset https_proxy http_proxy"
alias clash-on="screen -S clash clash"
alias clash-off="screen kill clash"' >> ~/.bash_inside

# 如果不依赖KDE的代理，只指定chromium启动代理，则可以任选其一：
# 1、在`~/.config/chromium-flags.conf`中添加--proxy-server=http://localhost:7890选项
# 2、新建脚本chromium-with-proxy.sh，写入以下内容：
#    /usr/bin/chromium  --proxy-server=http://localhost:7890
#    然后每次使用bash chromium-with-proxy.sh来启动。如果想同时硬解视频，需要往该脚本中添加相关的选项。
