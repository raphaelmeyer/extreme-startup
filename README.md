# extreme-startup

A skeleton for extreme startup in C++11 and based on mongoose.

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

