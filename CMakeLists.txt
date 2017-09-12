cmake_minimum_required(VERSION 2.6)
project(ludo)

set(LUA_VERSION 5.3.4)
set(LUAROCKS_VERSION 2.4.2)
set(ROOT ${CMAKE_SOURCE_DIR})

include(ExternalProject) # for building 3rd-party dependencies

# build Lua
ExternalProject_Add(Lua
  URL ${ROOT}/deps/lua-${LUA_VERSION}.tar.gz
  UPDATE_COMMAND "" # kept to prevent update step from re-running every build
  SOURCE_DIR Lua
  CONFIGURE_COMMAND "" # prevent default configure step from running
  BINARY_DIR Lua
  BUILD_COMMAND make linux
  INSTALL_COMMAND make -e INSTALL_TOP=${ROOT}/deps/lua install
)

# build LuaRocks
ExternalProject_Add(LuaRocks
  DEPENDS Lua
  URL ${ROOT}/deps/luarocks-${LUAROCKS_VERSION}.tar.gz
  UPDATE_COMMAND "" # kept to prevent update step from re-running every build
  SOURCE_DIR LuaRocks
  CONFIGURE_COMMAND ./configure --prefix=${ROOT}/deps/luarocks --force-config --with-lua=${ROOT}/deps/lua
  LOG_CONFIGURE 1
  BINARY_DIR LuaRocks
  BUILD_COMMAND make build
  LOG_BUILD 1
  INSTALL_COMMAND make install
)
