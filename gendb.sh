#!/bin/bash

mkdir aya -p

pkgs=$(curl -s https://mirror.zhullyb.top/zhullyb.db|bsdtar xf - -O|awk '/%FILENAME%/{getline;print}')

wget https://mirror.zhullyb.top/zhullyb.db -P zhullyb/
wget https://mirror.zhullyb.top/zhullyb.files -P zhullyb/
for pkg in $pkgs; do 
    echo Downloading $pkg
    wget -q https://mirror.zhullyb.top/$pkg -P zhullyb/
done

useradd builder -m
mkdir -p /home/builder/.config/
echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "refresh_token: 'xxxxx'" > /home/builder/.config/aliyunpan.yaml
sudo -u builder pip install aliyunpan
export PATH=$PATH:/home/builder/.local/bin
sudo -u builder aliyunpan sync zhullyb/
