local Class = require("lib.Class")

local Component = Class:extend()

function Component:init(position, size)
	self.position = position or vector.new(1, 1)
	self.size = size or vector.new(5, 3)
	self.canvas = nil
	self.visible = true
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
end

function Component:configure(configuration)
	for key, value in pairs(configuration) do
		self[key] = value
	end

	return self
end

function Component:__click()

end

return Component
