#!/bin/bash

mkdir -p build
rm -r ./build/*
cd build

cmake_file_dir=$(echo ${1} | grep -o ".*/projects/[^/]*/[^/]*")
cmake_file_path=$(ls ${cmake_file_dir}/CMakeLists.txt)
echo ${cmake_file_path}

cmake ${cmake_file_dir}
make -j 8
cd ..
