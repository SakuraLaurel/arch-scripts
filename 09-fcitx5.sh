sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-mozc fcitx5-pinyin-zhwiki
echo 'GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
GLFW_IM_MODULE=ibus' | sudo tee -a /etc/environment