local strings = require("utility.strings")
local Component = require("ui.components.Component")

local Text = Component:extend()

function Text:init(text, position, size, textColor, backgroundColor)
	Component.init(self, position, size)
	self.text = text or "text"
	self.textColor = textColor or colors.white
	self.backgroundColor = backgroundColor or colors.black
end

function Text:draw()
	self.canvas:text(strings.fit(self.text, self.size.x), self.position, self.textColor, self.backgroundColor)
end

return Text
