local Class = require("lib.Class")

local Renderer = Class:extend()

function Renderer:init(canvas)
	self._components = {}
	self._canvas = canvas
end

function Renderer:addComponent(component)
	component.canvas = self._canvas
	table.insert(self._components, component)
end

function Renderer:render(force)
	if (force) then
		self._canvas:clear()
	end

	for i, value in ipairs(self._components) do
		value:render()
	end
end

return Renderer
