--[=[

NETWORK-CENTRIC HELPERS

--]=]

module("tbx.net", package.seeall)


-- Return the current hostname, in short form (no FQDN)
function gethostname()
	local f = io.popen('/bin/hostname', 'r')
	if f == nil then return '' end
	local hn = f:read('*l')
	f:close()
	-- shave off anything after a . (including the .)
	local idx = hn:find('%.')
	if idx then hn = hn:sub(1, idx-1) end
	return hn
end
