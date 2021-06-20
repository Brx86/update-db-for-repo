#!/bin/bash

mkdir aya -p

#urls=$(curl https://github.com/Brx86/repo/releases/tag/x86_64 -s|grep "/Brx86/repo/releases/download/x86_64/"|awk -F '"|"' '{print$2}')
urls=(/Brx86/repo/releases/download/x86_64/pepper-flash-32.0.0.465-1-x86_64.pkg.tar.zst
/Brx86/repo/releases/download/x86_64/ttf-ms-fonts-2.0-12-any.pkg.tar.zst
/Brx86/repo/releases/download/x86_64/woeusb-5.1.2-1-any.pkg.tar.zst
)
for i in ${urls[*]}; do 
pkg=$(echo $i|awk -F '/' '{print$7}')
echo Downloading $pkg
wget -q https://github.com/$i -P aya/
repo-add aya.db.tar.gz ./aya/$pkg
done

