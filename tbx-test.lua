require('tbx.init')
require('tbx.object')
require('tbx.table')
require('tbx.string')
require('tbx.date')
require('tbx.net')
require('tbx.debug')
require('tbx.json')
require('tbx.csv')

for k,v in pairs(tbx) do print(k, v) end


--
-- Test objects
--
print(string.color("\nTesting objects", 'bblue'))
Rect = tbx.Object:extend()

function Rect:initialize(w, h)
	self.w = w
	self.h = h
end
function Rect:getArea()
	return self.w * self.h
end

rect = Rect:new(4, 5)
print("Rectangle area:", rect:getArea())


--
-- Test dates
--
print(string.color("\nTesting date helpers", "bblue"))
d = tbx.date.parse("2012-06-12 22:10:35", true)
print("Timestamp:", d)


--
-- Test JSON
--
print(string.color("\nTesting JSON helpers", "bblue"))
json = '{"one": 1, "two": 2, "sub": {"three": 3}}'
t = tbx.json.decode(json)
tbx.debug.dump(t)
json = tbx.json.encode(t)
print(json)

--
-- Test CSV
--
print(string.color("\nTesting CSV helpers", "bblue"))
csv = '"Judd","Jon ""BDOL"" Cochran","Bob"'
t = tbx.csv.decode(csv)
tbx.debug.dump(t)
csv = tbx.csv.encode(t)
print(csv)

--
-- Test Net
--
print(string.color("\nTesting net helpers", "bblue"))
print("Hostname:", tbx.net.gethostname())
