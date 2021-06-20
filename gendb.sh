#!/bin/bash

mkdir aya -p

urls=$(curl https://github.com/Brx86/repo/releases/tag/x86_64 -s|grep "/Brx86/repo/releases/download/x86_64/"|awk -F '"|"' '{print$2}')
for i in ${urls[*]}; do 
echo Downloading $i
wget -q https://github.com/$i -P aya/
done

repo-add aya.db.tar.gz ./aya/*