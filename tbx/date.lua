--[=[

DATE HELPERS

--]=]

module("tbx.date", package.seeall)


-- Parse a date (or date/time) into a Lua date table.
-- Format should be "yyyy-mm-dd" or "yyyy-mm-dd HH:MM:ss".
-- If "unixtime" is true, then return a UNIX timestamp, otherwise return
-- the Lua date table.
function parse(d, unixtime)
	local t = {
		year  = d:sub(1, 4),
		month = d:sub(6, 7),
		day   = d:sub(9, 10),
		hour  = 0,
		min   = 0,
		sec   = 0
	}
	if #d > 10 then
		t.hour = d:sub(12, 13)
		t.min  = d:sub(15, 16)
		t.min  = d:sub(18, 19)
	end
	if unixtime then return os.time(t) end
	return t
end
