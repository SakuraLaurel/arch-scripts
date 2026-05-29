#!/bin/zsh

# 配置代理

SERVICE="Wi-Fi"
HOST="127.0.0.1"
PORT="7890"

networksetup -setwebproxy "$SERVICE" "$HOST" "$PORT"
networksetup -setsecurewebproxy "$SERVICE" "$HOST" "$PORT"

networksetup -setwebproxystate "$SERVICE" on
networksetup -setsecurewebproxystate "$SERVICE" on

# 启动服务

mihomo
