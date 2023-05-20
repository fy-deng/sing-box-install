#!/bin/bash

# 检查系统架构
ARCH=$(uname -m)

# 根据架构执行命令
if [[ "$ARCH" == "x86_64" || "$ARCH" == "amd64" ]]; then
  echo "Detected AMD64 architecture. Download sing-box now."
  curl -Lo ~/sb.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.2.7/sing-box-1.2.7-linux-amd64.tar.gz && \
  tar -xzf ~/sb.tar.gz -C ~/ && \
  sudo cp -f ~/sing-box-*/sing-box /usr/local/bin/ && \
  rm -rf ~/sb.tar.gz ~/sing-box-*
  
elif [[ "$ARCH" == "aarch64" || "$ARCH" == "arm64" ]]; then
  echo "Detected ARM64 architecture. Download sing-box now."
  curl -Lo ~/sb.tar.gz https://github.com/SagerNet/sing-box/releases/download/v1.2.7/sing-box-1.2.7-linux-arm64.tar.gz && \
  tar -xzf ~/sb.tar.gz -C ~/ && \
  sudo cp -f ~/sing-box-*/sing-box /usr/local/bin/ && \
  rm -rf ~/sb.tar.gz ~/sing-box-*
else
  echo "Unsupported architecture: $ARCH"
  exit 1
fi