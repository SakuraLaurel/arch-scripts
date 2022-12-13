# 不要直接运行

# install
sh <(curl https://mirrors.tuna.tsinghua.edu.cn/nix/latest/install) --daemon

echo 'substituters = https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store https://cache.nixos.org/' | sudo tee -a /etc/nix/nix.conf
sudo systemctl restart nix-daemon.service
sudo nix-channel --add https://mirrors.tuna.tsinghua.edu.cn/nix-channels/nixpkgs-unstable nixpkgs
sudo nix-channel --update

# 如果安装途中卡住，那就取消那一步，然后更新完镜像按指示补充之前的步骤。如：
# sudo -i nix-channel --update nixpkgs

# uninstall
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