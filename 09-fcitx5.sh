sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-mozc fcitx5-pinyin-zhwiki
# 备注：kde5版本除了下列设置外，还推荐设置
# GTK_IM_MODULE=fcitx
# QT_IM_MODULE=fcitx
# SDL_IM_MODULE=fcitx
# GLFW_IM_MODULE=ibus
# 但是kde6不推荐设置，因为GUI服务器换为了wayland
echo 'XMODIFIERS=@im=fcitx' | sudo tee -a /etc/environment
# 完事后记得到设置里添加中文输入法

# 对于Chromium以及其他electron软件，需要进行以下flags设置
# --ozone-platform=wayland --enable-wayland-ime
