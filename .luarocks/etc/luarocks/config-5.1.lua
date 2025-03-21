-- LuaRocks configuration

rocks_trees = {
   { name = "user", root = home .. "/.luarocks" };
   { name = "system", root = "/home/runner/work/jsearchdata/jsearchdata/.luarocks" };
}
lua_interpreter = "lua";
variables = {
   LUA_DIR = "/home/runner/work/jsearchdata/jsearchdata/.lua";
   LUA_BINDIR = "/home/runner/work/jsearchdata/jsearchdata/.lua/bin";
}
