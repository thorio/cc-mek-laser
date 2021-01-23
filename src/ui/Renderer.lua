local Class = require("lib.Class")

local Renderer = Class:extend()

function Renderer:init(canvas)
	self._scene = nil
	self._canvas = canvas
	self.framerate = 20
end

function Renderer:setScene(scene)
	self._scene = scene
	self._scene:setCanvas(self._canvas)
	self:render(true)
end

function Renderer:getRun()
	return function()
		self:run()
	end
end

function Renderer:run()
	while true do
		self:render()
		sleep(1 / self.framerate)
	end
end

function Renderer:clear()
	self._canvas:clear()
end

function Renderer:render()
	for i, value in ipairs(self._scene:getComponents()) do
		value:render()
	end
end

return Renderer
