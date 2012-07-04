--[=[

CSV HELPERS

--]=]

module("tbx.csv", package.seeall)


-- Decode a CSV string into a table of tables. The outer table
-- will contain one row per line in the CSV file.
--
-- From PIL: http://www.lua.org/pil/20.4.html
function decode(s)
	local s = s .. ','   -- ending comma
	local t = {}         -- table to collect fields
	local fieldstart = 1
	repeat
		-- next field is quoted? (start with `"'?)
		if string.find(s, '^"', fieldstart) then
			local a, c
			local i  = fieldstart
			repeat
				-- find closing quote
				a, i, c = string.find(s, '"("?)', i+1)
			until c ~= '"'    -- quote not followed by quote?
			if not i then error('unmatched "') end
			local f = string.sub(s, fieldstart+1, i-1)
			table.insert(t, (string.gsub(f, '""', '"')))
			fieldstart = string.find(s, ',', i) + 1
		else                -- unquoted; find next comma
			local nexti = string.find(s, ',', fieldstart)
			table.insert(t, string.sub(s, fieldstart, nexti-1))
			fieldstart = nexti + 1
		end
	until fieldstart > string.len(s)
	return t
end

-- Encode
function encode(t)
	local s = ""
	for _,p in pairs(t) do
		s = s .. "," .. escape(p)
	end
	return string.sub(s, 2)      -- remove first comma
end

-- Escape any reserved characters (commas and double-quotes) for use in
-- CSV format, and surround that with double quotes.
function escape(s)
	s = '"' .. string.gsub(s, '"', '""') .. '"'
	return s
end
