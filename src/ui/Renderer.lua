local Class = require("lib.Class")

local Renderer = Class:extend()

function Renderer:init(canvas)
	self.components = {}
	self.canvas = canvas
end

function Renderer:addComponent(component)
	component.canvas = self.canvas
	table.insert(self.components, component)
end

function Renderer:render(force)
	if (force) then
		self.canvas:clear()
	end

	for i, value in ipairs(self.components) do
		value:render()
	end
end

return Renderer
