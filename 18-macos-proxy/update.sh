#!/bin/zsh

# 更新订阅

URL="..."
CONFIG="$HOME/.config/mihomo/config.yaml"
curl -L "$URL" -o "$CONFIG"
sed -i '' 's/external-controller: 127.0.0.1:9090/external-controller: 127.0.0.1:9090\
external-ui: ui/g' "$CONFIG"
