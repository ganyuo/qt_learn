#!/bin/bash

# 字符串处理：https://www.cnblogs.com/kevingrace/p/5996133.html

mkdir -p build
rm -r ./build/*
cd build

pro_file_dir=$(echo ${1} | grep -o ".*/projects/[^/]*")
pro_file_path=$(ls ${pro_file_dir}/*.pro)
echo ${pro_file_path}

qmake CONFIG+=debug CONFIG+=qml_debug TARGET=a.out ${pro_file_path}
make
cd ..
