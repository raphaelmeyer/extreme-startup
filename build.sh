#!/bin/bash

PROJECT_ROOT=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
BUILD=${PROJECT_ROOT}/build

export CC=clang
export CXX=clang++

if [ ! -d ${BUILD} ] ; then
  mkdir -p ${BUILD}
fi

cd ${BUILD}
cmake -G Ninja ${PROJECT_ROOT}

cd ${PROJECT_ROOT}
cmake --build build --target all

