# ludo

Ludo is intended to be a set of interactive simulation development libraries for applications including but not limited to video games.  It is planned to include some engine implementations but for their use to be optional.

The initial goal is to implement Entity Component System (ECS) functionality.  It is very likely that the ECS functionality will NOT be "pure" as advocated by some but instead will be an organic mash-up of what works and feels right.

## Dependencies

Runtime dependencies will be stored in source control (Lua), but build-time dev dependencies will not (CMake, LuaRocks, busted, compilers, etc.).

Runtime dependencies (tentative):
- Lua: scripting language of choice though it will be transpiled from Moonscript
- SFML: input, graphics, and audio
- Bullet Physics: physics

Dev dependencies (adopted):
- Git: source control
- CMake: build system C/C++ code
- make (Linux) or mingw-make (Windows): to build Lua and LuaRocks as natively as possible
- GCC: C/C++ compiler: MinGW provides a version for Windows; alternatives may be investigated in the future

Dev dependencies (tentative):
- LuaRocks: installing/updating other dependencies
- Moonscript: scripting language of choice due to lower verbosity compared to Lua; installed via LuaRocks
- busted: Unit test framework for Lua/Moonscript code; installed via LuaRocks

CMake will be used as the primary build tool, outputting Make files for GCC tools.  Platform-specific tools may be adopted in the future.

### Windows (Windows 7 64-bit)

From build sub-directory in ROOT:
1. cmake .. -G "MinGW Makefiles"
2. cmake --build .
produces liblua.a and lua.exe (just for verifying compilation of library)

### Linux (Ubuntu 16.04)

#### For lua

- Needed to install libreadline-dev via apt-get

1. make linux
2. make -e INSTALL_TOP=/home/dc/lua/lua-5.3.4

#### For luarocks

1. ./configure --prefix=/home/dc/lua/luarocks-2.4.2/install --force-config
2. make build
3. make install
