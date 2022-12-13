# 不要直接运行

# install
# 即使为单用户安装，也需要开启代理，并设置https_proxy等变量
# 为多用户安装时，daemon会绕过代理的变量，无论如何都会很慢
sh <(curl https://mirrors.tuna.tsinghua.edu.cn/nix/latest/install)

mkdir -p ~/.config/nix
echo 'substituters = https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store https://cache.nixos.org/' | tee ~/.config/nix/nix.conf
# 如果出现域名无法解析的问题，那检查一下/etc/resolv.conf有没有正确链接
nix-channel --add https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixpkgs-unstable nixpkgs
nix-channel --update


# uninstall
# 此处是为多用户安装的nix卸载方法，暂未探索单用户的卸载方法。
sudo rm -rf /nix /etc/nix /etc/profile/nix.sh ~root/.nix-profile ~root/.nix-defexpr ~root/.nix-channels ~/.nix-profile ~/.nix-defexpr ~/.nix-channels

for i in $(seq 1 32); do
  sudo userdel nixbld$i
done
sudo groupdel nixbld

sudo systemctl stop nix-daemon.socket
sudo systemctl stop nix-daemon.service
sudo systemctl disable nix-daemon.socket
sudo systemctl disable nix-daemon.service
sudo systemctl daemon-reload

sudo rm /etc/profile /etc/bashrc /etc/zshrc

# 其他可能的
sudo mv /etc/profile.d/nix.sh.backup-before-nix /etc/profile.d/nix.sh
sudo mv /etc/bash.bashrc.backup-before-nix /etc/bash.bashrc