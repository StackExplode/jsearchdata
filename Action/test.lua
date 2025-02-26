-- Lua 脚本示例：输出调试信息到 GitHub Actions 日志
os.execute("echo '::debug::Starting the Lua script execution.'")  -- 调试信息
print("inner print")
os.execute("echo '::error::Test Error.'") 
os.execute("echo '::warning::Bye!'") 
