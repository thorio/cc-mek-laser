local Class = require("lib.Class")
local EventDispatcher = require("lib.EventDispatcher")
local collision = require("utility.collision")

local Component = Class:extend()

function Component:init(position, size)
	self.position = position or vector.new(1, 1)
	self.size = size or vector.new(5, 3)
	self.canvas = nil
	self.visible = true

	self.clicked = EventDispatcher()
end

function Component:render()
	if (self.canvas ~= nil and self.visible) then
		self:draw()
	end
end

function Component:draw()
	-- override this
end

function Component:addTo(container)
	container:addComponent(self)
	return self
end

function Component:configure(configuration)
	for key, value in pairs(configuration) do
		self[key] = value
	end

	return self
end

function Component:isPointInside(point)
	return collision.pointInRect(point, self.position, self.size)
end

return Component
