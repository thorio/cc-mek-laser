local Component = require("ui.components.Component")

local ProgressBar = Component:extend()

function ProgressBar:init(position, size, progressColor, backgroundColor)
	Component.init(self, position, size)
	self.progress = 0.5
	self.progressColor = progressColor or colors.green
	self.backgroundColor = backgroundColor or colors.gray
end

function ProgressBar:draw()
	local splitPosition = self.position.x + math.floor(self.size.x * self.progress + 0.5)
	local bottomEdge = self.position.y + self.size.y
	local endPosition = self.position.x + self.size.x

	self.canvas:rectanglePoints(self.position, vector.new(splitPosition, bottomEdge), self.progressColor)
	self.canvas:rectanglePoints(vector.new(splitPosition, self.position.y), vector.new(endPosition, bottomEdge), self.backgroundColor)
end

return ProgressBar
