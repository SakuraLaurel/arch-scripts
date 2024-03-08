sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-mozc fcitx5-pinyin-zhwiki
# 备注：kde5版本除了下列设置外，还推荐设置
# GTK_IM_MODULE=fcitx
# QT_IM_MODULE=fcitx
# 但是kde6不推荐设置，因为GUI服务器换为了wayland
echo 'XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus' | sudo tee -a /etc/environment
