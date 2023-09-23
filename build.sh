#!/bin/bash

# https://www.cnblogs.com/kevingrace/p/5996133.html

mkdir -p build
rm -r ./build/*
cd build

pro_file_dir=$(echo ${1} | grep -o ".*/projects/[^/]*")
pro_file_path=$(ls ${pro_file_dir}/*.pro)

/home/ganyuo/program/anaconda3/bin/qmake ${pro_file_path} \
    LIBS+=-L/home/ganyuo/program/anaconda3/lib \
    CONFIG+=debug CONFIG+=qml_debug \
    TARGET=a.out
make
cd ..
