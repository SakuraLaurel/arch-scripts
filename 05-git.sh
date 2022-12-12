sudo pacman -S git
# 我的用户名为sakura，邮箱为brynhild@pku.edu.cn
git config --global user.name "sakura"
git config --global user.email "brynhild@pku.edu.cn"

# 非标准端口使用git的格式如下，/path表示/home/sakura这样的路径
# git clone ssh://user@ip:port/path
# 如果要生成新的密钥，输入
# ssh-keygen -t rsa -C 邮箱地址
# 然后一路回车。公钥是id_rsa.pub
# 来源：https://www.liaoxuefeng.com/wiki/896043488029600