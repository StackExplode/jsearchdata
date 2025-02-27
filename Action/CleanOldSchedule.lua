local json = require("JSON")

local fname = "d_schedule.json"

os.execute("echo '::notice::Script start!v2.0'")

function GetTimeStampFromStr(date_str)

-- 提取年、月、日
local year, month, day = date_str:match("^(%d+)-(%d+)-(%d+)$")

-- 将它们转换为数字
year = tonumber(year)
month = tonumber(month)
day = tonumber(day)

-- 创建一个日期表
local date_table = {
    year = year,
    month = month,
    day = day,
    hour = 0,   -- 设置为00:00:00
    min = 0,
    sec = 0,
    isdst = false  -- 不考虑夏令时
}

-- 将日期表转化为时间戳
 return os.time(date_table)
end



local file = io.open(fname, "r")
if not file then 
	os.execute("echo '::error::File not found!'")
	return
end
local content = file:read("*all")
file:close()
local jjj = json:decode(content)
local now = os.time()

for k,v in pairs(jjj) do
	local t = GetTimeStampFromStr(v["date"])
	if now - t > 24*3600 then
		jjj[k] = nil
	end
end

local rst = json:encode_pretty(jjj,nil,{pretty = true, align_keys = false, array_newline = true, indent = "  "})

file = io.open(fname, "w")
file:write(rst)
file:close()

os.execute("echo '::notice::Script finished!'")

