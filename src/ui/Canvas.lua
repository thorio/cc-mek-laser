local Class = require("lib.Class")
local strings = require("utility.strings")

local Canvas = Class:extend()

function Canvas:init(window)
	self.window = window
	self.textColor = colors.white
	self.backgroundColor = colors.black
end

function Canvas:setColors(textColor, backgroundColor)
	self.window.setTextColor(textColor or self.textColor)
	self.window.setBackgroundColor(backgroundColor or self.backgroundColor)
end

function Canvas:rectanglePoints(firstPoint, secondPoint, backgroundColor)
	local xPos = math.min(firstPoint.x, secondPoint.x)
	local yPos = math.min(firstPoint.y, secondPoint.y)
	local width = math.abs(firstPoint.x - secondPoint.x)
	local height = math.abs(firstPoint.y - secondPoint.y)

	self:rectangle(vector.new(xPos, yPos), vector.new(width, height), backgroundColor)
end

function Canvas:rectangle(position, size, backgroundColor)
	self:setColors(nil, backgroundColor)
	local str = strings.blank(size.x)

	for i = 0, size.y - 1 do
		self.window.setCursorPos(position.x, position.y + i)
		self.window.write(str)
	end
end

function Canvas:text(text, pos, textColor, backgroundColor)
	self:setColors(textColor, backgroundColor)
	self.window.setCursorPos(pos.x, pos.y)

	self.window.write(text)
end

function Canvas:clear()
	self:setColors()
	self.window.clear()
end

return Canvas
