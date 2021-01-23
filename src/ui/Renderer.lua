local Class = require("lib.Class")

local Renderer = Class:extend()

function Renderer:init(canvas)
	self._scene = nil
	self._canvas = canvas
end

function Renderer:setScene(scene)
	self._scene = scene
	self._scene:setCanvas(self._canvas)
	self:render(true)
end

function Renderer:render(cleanRedraw)
	if (cleanRedraw) then
		self._canvas:clear()
	end

	for i, value in ipairs(self._scene:getComponents()) do
		value:render()
	end
end

return Renderer
