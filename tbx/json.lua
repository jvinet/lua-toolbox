--[=[

JSON HELPERS

--]=]

module("tbx.json", package.seeall)

local json = require 'json'

-- A safe JSON decode function
function decode(json_str)
	decode = function(json_str)
		return json.decode.decode(json_str)
	end

	local status, data = pcall(decode, json_str)
	if status then return data end

	-- error occurred
	-- FIXME: throw an error, don't output a string
	print("Error decoding JSON: " .. data)
	return nil
end

-- A safe JSON encode function
function encode(data)
	encode = function(data)
		return json.encode.encode(data)
	end

	local status, json_str = pcall(encode, data)
	if status then return json_str end

	-- error occurred
	-- FIXME: throw an error, don't output a string
	print("Error encoding JSON: " .. json_str)
	return nil
end
