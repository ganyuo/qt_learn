#!/bin/bash

mkdir -p build
rm ./build/* -rf
cd build
/home/ganyuo/program/anaconda3/bin/qmake $1 LIBS+=-L/home/ganyuo/program/anaconda3/lib  CONFIG+=debug CONFIG+=qml_debug
make
cd ..
