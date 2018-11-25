--
-- log.lua
--
-- Copyright (c) 2016 rxi
--
-- This library is free software; you can redistribute it and/or modify it
-- under the terms of the MIT license. See LICENSE for details.
--

local log = { _version = "0.1.0" }

log.usecolor = true
log.outfile = "log"
log.level = "trace"


local modes = {
	{ name = "trace", termColor = "\27[34m", rgb = {1, 1, 1, 1}},
	{ name = "debug", termColor = "\27[36m", rgb = {1, 1, 1, 1}},
	{ name = "info",  termColor = "\27[32m", rgb = {1, 1, 1, 1}},
	{ name = "warn",  termColor = "\27[33m", rgb = {1, 1, 1, 1}},
	{ name = "error", termColor = "\27[31m", rgb = {1, 1, 1, 1}},
	{ name = "fatal", termColor = "\27[35m", rgb = {1, 1, 1, 1}},
}


local levels = {}
for i, v in ipairs(modes) do
	levels[v.name] = i
end


local round = function(x, increment)
	increment = increment or 1
	x = x / increment
	return (x > 0 and math.floor(x + .5) or math.ceil(x - .5)) * increment
end


local _tostring = tostring

local tostring = function(...)
	local t = {}
	for i = 1, select('#', ...) do
		local x = select(i, ...)
		if type(x) == "number" then
			x = round(x, .01)
		end
		t[#t + 1] = _tostring(x)
	end
	return table.concat(t, " ")
end

for i, x in ipairs(modes) do
	local nameupper = x.name:upper()
	log[x.name] = function(...)

		-- Return early if we're below the log level
		if i < levels[log.level] then
			return
		end

		local msg = tostring(...)
		local info = debug.getinfo(2, "Sl")
		local lineinfo = info.short_src .. ":" .. info.currentline

		-- Output to LoveDebug
		_DebugInterface.log(
			msg,
			lineinfo,
			nameupper,
			os.date("%H:%M:%S"),
			log.usecolor and x.termColor,
			log.usecolor and x.rgb
		)

		-- Output to log file
		if log.outfile then
				local str = string.format("[%-6s%s] %s: %s\n", nameupper, os.date(), lineinfo, msg)
				love.filesystem.append(log.outfile, str)
		end
	end
end


return log
