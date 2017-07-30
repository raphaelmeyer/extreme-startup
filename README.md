# extreme-startup

A server skeleton for the extreme startup game by 
Robert Chatley and Matt Wynne.

Implemented in C++11 and based on mongoose.

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

    ./build/web-app/server-exe


