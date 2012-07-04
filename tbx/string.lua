--[=[

EXTENSIONS: STRING

--]=]

module("tbx", package.seeall)

-- Split a string
function string:split(sep)
	local sep, fields = sep or ":", {}
	local pattern = string.format("([^%s]+)", sep)
	self:gsub(pattern, function(c) fields[#fields+1] = c end)
	return fields
end

-- Parse color names and convert them into ANSI sequences
function string:color(name, modes)
	local modes = modes or {}
	local name  = name

	local mode_map = {
		bright    = 1,
		underline = 4,
		blink     = 5,
		swapbgfg  = 7,
		hidefg    = 8
	}
	local color_map = {
		black   = 30,
		red     = 31,
		green   = 32,
		yellow  = 33,
		blue    = 34,
		magenta = 35,
		cyan    = 36,
		white   = 37,
		default = 38
	}

	local ret = "["

	for _,mode in ipairs(modes) do
		ret = ret .. mode_map[mode] .. ';'
	end

	if color_map[name] == nil then
		if name:sub(1, 1) == 'b' then
			name = name:sub(2)
			table.insert(modes, 'bright')
			return self:color(name, modes)
		end
		return self
	end

	ret = ret .. color_map[name] .. 'm'
	ret = ret .. self .. '[0m'
	return ret
end
