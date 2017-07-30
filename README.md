# extreme-startup

A server skeleton for the extreme startup game by 
Robert Chatley and Matt Wynne.

Implemented in C++11 and based on mongoose.

## build

    git clone https://github.com/raphaelmeyer/extreme-startup.git
    git submodule init
    git submodule update

    cd extreme-startup
    mkdir -p build
    cd build
    cmake ..
    cd ..
    cmake --build build --target all


## run

    ./build/web-app/server-exe


