#!/bin/zsh

SERVICE="Wi-Fi"

networksetup -setwebproxystate "$SERVICE" off
networksetup -setsecurewebproxystate "$SERVICE" off
