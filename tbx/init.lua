--[=[

MAIN `tbx` MODULE

NB: These functions will be placed into the global namespace.

--]=]

module("tbx", package.seeall)


-- A shortcut for print(string.format(...))
function _G.printf(fmt, ...)
	io.write(string.format(fmt, unpack(arg)))
	io.flush()
end

-- Same as printf(), but add a newline
function _G.printfn(fmt, ...)
	print(string.format(fmt, unpack(arg)))
end

-- A basic sleep function - relies on the presence of a 
-- "sleep" command.
function _G.sleep(secs)
	os.execute("sleep " .. tonumber(secs))

	-- Alternate method that requires the "luasocket" library
	--local socket = require('socket')
	--socket.select(nil, nil, secs)
end
