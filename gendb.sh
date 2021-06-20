#!/bin/bash

mkdir aya
ls -la
pwd
urls=`curl https://github.com/Brx86/repo/releases/tag/$1 -s|grep "/Brx86/repo/releases/download/$1/"|awk -F '"|"' '{print$2}'`

for i in ${urls[*]}; do 
wget https://github.com/$i -P aya/
done

cd aya
repo-add aya.db.tar.gz ./*