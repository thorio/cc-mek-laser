local Class = require("lib.Class")
local Canvas = require("ui.Canvas")
local Button = require("ui.components.Button")
local Renderer = require("ui.Renderer")

local Application = Class:extend()

function Application:init(terminal)
	self._terminal = terminal
	self._renderer = Renderer(Canvas(self._terminal))
	self.framerate = 20
end

function Application:addComponent(component)
	self._renderer:addComponent(component)
end

function Application:start()
	while true do
		sleep(1 / self.framerate)
		self._renderer:render()
	end
end

function Application:loadScene(scene)
	self._renderer:setScene(scene)
end

return Application
