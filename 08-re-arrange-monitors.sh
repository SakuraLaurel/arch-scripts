# 仅针对我个人需求，快速重排显示器位置
# 双屏
xrandr --output eDP-1 --mode 1920x1080 --rate 60 --pos 0x0 --primary --output HDMI-2 --mode 2560x1440 --rate 60 --rotate left --pos -1440x-1050
# 单屏
xrandr --output eDP-1 --off