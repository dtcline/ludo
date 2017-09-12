# ludo

## Dependencies

Runtime dependencies will be stored in source control while dev (compile-time) dependencies will not be.

Runtime dependencies:
- Lua: scripting language of choice though it will be transpiled from Moonscript
- SFML: input, graphics, and audio
- Bullet Physics: physics

Dev dependencies:
- Git: source control
- CMake: build system C/C++ code
- make (Linux) or mingw-make (Windows): to build Lua and LuaRocks as natively as possible
- GCC: C/C++ compiler: MinGW provides a version for Windows; alternatives may be investigated in the future
- LuaRocks: installing/updating other dependencies
- Moonscript: scripting language of choice due to lower verbosity compared to Lua; installed via LuaRocks
- busted: Unit test framework for Lua/Moonscript code; installed via LuaRocks
