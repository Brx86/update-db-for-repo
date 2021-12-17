#!/bin/bash

mkdir aya -p

urls=$(curl https://github.com/Brx86/repo/releases/tag/x86_64 -s|grep "/Brx86/repo/releases/download/x86_64/"|awk -F '"|"' '{print$2}')

for i in ${urls[*]}; do 
pkg=$(echo $i|awk -F '/' '{print$7}')
echo Downloading $pkg
wget -q https://github.com/$i -P aya/
repo-add -p aya.db.tar.gz ./aya/$pkg
pip install aliyunpan
echo "refresh_token: 'cc6fa2baa3a3428c81a0fbc0aa77af73'"  >  ~/.config/aliyunpan.yaml
aliyunpan sync aya
done
