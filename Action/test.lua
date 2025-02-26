local json = require "json"

-- Lua 脚本示例：输出调试信息到 GitHub Actions 日志
os.execute("echo '::notice::Starting the Lua script execution.'")  -- 调试信息
print("inner print")
local file = io.open("carddata.json", "r")
local content = file:read("*all")
local data_json = json:decode(content)
print(data_json[1]["name"])

os.execute("echo '::notice::Bye!'")  -- 调试信息

