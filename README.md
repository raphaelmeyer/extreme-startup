# extreme-startup

A skeleton for extreme startup in C++11 and based on mongoose.

[![Build Status](https://travis-ci.org/raphaelmeyer/extreme-startup.svg?branch=master)](https://travis-ci.org/raphaelmeyer/extreme-startup)
[![Build status](https://ci.appveyor.com/api/projects/status/2slbcx64usw9jpg5/branch/master?svg=true)](https://ci.appveyor.com/project/raphaelmeyer/extreme-startup/branch/master)

## build instructions

### get repository

    git clone https://github.com/raphaelmeyer/extreme-startup.git
    cd extreme-startup

    git submodule init
    git submodule update

### build

    mkdir -p build
    cd build
    cmake ..
    cd ..
    cmake --build build --target all

### run

    ./build/main/server-exe


To get started have a look at `web-app` and `web-app-test`.

