#!/bin/bash

mkdir aya -p

urls=$(curl https://github.com/Brx86/repo/releases/tag/x86_64 -s|grep "/Brx86/repo/releases/download/x86_64/"|awk -F '"|"' '{print$2}')

for i in ${urls[*]}; do 
    pkg=$(echo $i|awk -F '/' '{print$7}')
    echo Downloading $pkg
    wget -q https://github.com/$i -P aya/
    repo-add -p aya.db.tar.gz ./aya/$pkg
done

useradd builder -m
mkdir -p /home/builder/.config/
echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
echo "refresh_token: 'xxxxxx'" > /home/builder/.config/aliyunpan.yaml
sudo -u builder pip install aliyunpan
export PATH=$PATH:/home/builder/.local/bin
sudo -u builder aliyunpan sync aya
