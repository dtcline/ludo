cmake_minimum_required(VERSION 2.6)
project(ludo)

set(LUA_VERSION 5.3.4)
set(ROOT ${CMAKE_SOURCE_DIR})

include(ExternalProject)
ExternalProject_Add(Lua
  URL ${ROOT}/deps/lua-${LUA_VERSION}.tar.gz
  SOURCE_DIR Lua
  UPDATE_COMMAND "" # kept to prevent update step from re-running every build
  CONFIGURE_COMMAND "" # prevent default configure step from running
  BINARY_DIR Lua
  BUILD_COMMAND make linux
  INSTALL_COMMAND make -e INSTALL_TOP=${ROOT}/deps/lua install
)
