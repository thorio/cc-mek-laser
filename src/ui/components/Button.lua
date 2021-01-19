local Class = require("lib.Class")
local Component = require("ui.components.Component")
local strings = require("utility.strings")

local Button = Component:extend()

function Button:init(text, position, size, textColor, backgroundColor)
	Component.init(self, position, size)
	self.text = text or "button"
	self.textColor = textColor or colors.white
	self.backgroundColor = backgroundColor or colors.gray
end

function Button:draw()
	local textHeight = self.position.y + math.floor(self.size.y / 2)
	local text = strings.center(self.text, self.size.x)

	self.canvas:rectangle(self.position, self.size, self.backgroundColor)
	self.canvas:text(text, vector.new(self.position.x, textHeight), self.textColor, self.backgroundColor)
end

return Button
