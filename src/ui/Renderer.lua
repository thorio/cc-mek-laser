local Renderer = Class:extend()

function Renderer:init(canvas)
	self.components = {}
	self.canvas = canvas
end

function Renderer:addComponent(component)
	component.canvas = self.canvas
	table.insert(self.components, component)
end

function Renderer:draw(force)
	if (force) then
		self.canvas:clear()
	end

	for i, value in ipairs(self.components) do
		value:draw()
	end
end

return Renderer
