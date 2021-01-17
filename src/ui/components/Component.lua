local Component = Class:extend()

function Component:init(position, size)
	self.position = position or vector.new(1, 1)
	self.size = size or vector.new(5, 3)
	self.canvas = nil
end

function Component:draw()
	-- do nothing
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

return Component
