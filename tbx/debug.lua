--[=[

DEBUGGING HELPERS

--]=]

module("tbx.debug", package.seeall)


-- Dump a variable in a human-readable format (useful for tables)
-- Return the dumped data as a string
function dump_str(o, indent_level)
	local ilvl = indent_level or 4
	local indent = function(n)
		local s = ''
		local n = n or ilvl
		for i = 0,n-1 do s = s .. ' ' end
		return s
	end

	if type(o) == 'table' then
		local s = '{\n'
		for k,v in pairs(o) do
			if type(k) ~= 'number' then
				if type(k) == 'table' then
					k = '<table>'
				elseif type(k) == 'function' then
					k = '<function>'
				else
					k = '"'..k..'"'
				end
			end
			s = s .. indent() .. '['..k..'] = ' .. dump_str(v, ilvl+4) .. '\n'
		end
		return s .. indent(ilvl-4) .. '}'
	else
		return tostring(o)
	end
end

-- Dump a variable to stdout
function dump(o)
	print(dump_str(o))
end
