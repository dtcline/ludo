cmake_minimum_required(VERSION 2.6)
project(ludo)

set(lua_version 5.3.4)
# had to change to using CMAKE_SOURCE_DIR on OSX (from CMAKE_BINARY_DIR)
set(lua_dir ${CMAKE_SOURCE_DIR}/deps/lua-${lua_version})
set(lua_src_dir ${lua_dir}/src)
set(lua_sources ${lua_src_dir}/lapi.c ${lua_src_dir}/lauxlib.c ${lua_src_dir}/lbaselib.c ${lua_src_dir}/lbitlib.c ${lua_src_dir}/lcode.c ${lua_src_dir}/lcorolib.c ${lua_src_dir}/lctype.c ${lua_src_dir}/ldblib.c ${lua_src_dir}/ldebug.c ${lua_src_dir}/ldo.c ${lua_src_dir}/ldump.c ${lua_src_dir}/lfunc.c ${lua_src_dir}/lgc.c ${lua_src_dir}/linit.c ${lua_src_dir}/liolib.c ${lua_src_dir}/llex.c ${lua_src_dir}/lmathlib.c ${lua_src_dir}/lmem.c ${lua_src_dir}/loadlib.c ${lua_src_dir}/lobject.c ${lua_src_dir}/lopcodes.c ${lua_src_dir}/loslib.c ${lua_src_dir}/lparser.c ${lua_src_dir}/lstate.c ${lua_src_dir}/lstring.c ${lua_src_dir}/lstrlib.c ${lua_src_dir}/ltable.c ${lua_src_dir}/ltablib.c ${lua_src_dir}/ltm.c ${lua_src_dir}/lundump.c ${lua_src_dir}/lutf8lib.c ${lua_src_dir}/lvm.c ${lua_src_dir}/lzio.c)

execute_process(COMMAND ${CMAKE_COMMAND} -E tar xzf ${CMAKE_SOURCE_DIR}/deps/lua-${lua_version}.tar.gz WORKING_DIRECTORY ${lua_dir})
set_source_files_properties(${lua_sources} PROPERTIES LANGUAGE CXX)
add_library(lualib STATIC ${lua_sources})
set_target_properties(lualib PROPERTIES OUTPUT_NAME "lua")

# only compiling the Lua interpretter to verify the Lua library
set_source_files_properties(${lua_src_dir}/lua.c PROPERTIES LANGUAGE CXX)
add_executable(lua ${lua_src_dir}/lua.c)
target_link_libraries(lua lualib)
