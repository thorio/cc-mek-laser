local Class = require("lib.Class")

local Scene = Class:extend()

function Scene:init()
	self._components = {}
	self._canvas = nil
end

function Scene:getComponents()
	return self._components
end

function Scene:addComponent(component)
	component.canvas = self._canvas
	table.insert(self._components, component)
end

function Scene:setCanvas(canvas)
	self._canvas = canvas
	for index, component in ipairs(self._components) do
		component.canvas = self._canvas
	end
end

return Scene
