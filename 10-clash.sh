# 本脚本（不）可直接运行，因为缺少配置文件
sudo pacman -S clash screen
# 复制配置文件为~/.config/clash/config.yaml，配置文件未在此仓库中给出
echo 'alias proxy-on="export https_proxy=127.0.0.1:7890 && export http_proxy=127.0.0.1:7890"
alias proxy-off="unset https_proxy http_proxy"
alias clash-on="screen -S clash clash"
alias clash-off="screen kill clash"' >> ~/.bash_inside