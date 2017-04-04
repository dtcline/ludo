# ludo

## Setting up dev environments

### Linux (Ubuntu 16.04)

#### For lua

- Needed to install libreadline-dev via apt-get

1. make linux
2. make -e INSTALL_TOP=/home/dc/lua/lua-5.3.4

#### For luarocks

1. ./configure --prefix=/home/dc/lua/luarocks-2.4.2/install --force-config
2. make build
3. make install
