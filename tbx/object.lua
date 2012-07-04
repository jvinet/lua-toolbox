--[=[

OBJECT/CLASS SUPPORT

Example:
  local Rect = Object:extend()
  function Rect:initialize(w, h)
    self.w = w
    self.h = h
  end
  function Rect:getArea()
    return self.w * self.h
  end

  local rect = Rect:new(4, 5)
  print(rect:getArea())

--]=]

module("tbx", package.seeall)

Object = {}
Object.meta = {__index = Object}

-- Create a new instance
function Object:new(...)
	local obj = setmetatable({}, self.meta)
	if obj.initialize then
		obj:initialize(...)
	end
	return obj
end

-- Create a new sub-class
function Object:extend()
	local sub = setmetatable({}, self.meta)
	sub.meta = {__index = sub}
	return sub
end

