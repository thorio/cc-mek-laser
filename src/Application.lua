local Class = require("lib.Class")
local Canvas = require("ui.Canvas")
local Button = require("ui.components.Button")
local Renderer = require("ui.Renderer")

local Application = Class:extend()

function Application:init(terminal)
	self._terminal = terminal
	self._rootCanvas = Canvas(self._terminal)
	self._renderer = Renderer(self._rootCanvas)
	self.framerate = 20
end

function Application:addComponent(component)
	self._renderer:addComponent(component)
end

function Application:start()
	self._rootCanvas:clear()
	while true do
		self._renderer:render()
		sleep(1 / self.framerate)
	end
end

return Application
