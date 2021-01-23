local Class = require("lib.Class")
local Canvas = require("ui.Canvas")
local Renderer = require("ui.Renderer")
local osEvents = require("lib.osEvents")

local Application = Class:extend()

function Application:init(terminal)
	self._terminal = terminal
	self._renderer = Renderer(Canvas(self._terminal))

	osEvents.monitorTouch:on(function()
		print("don't touch me")
	end)
end

function Application:addComponent(component)
	self._renderer:addComponent(component)
end

function Application:run()
	parallel.waitForAny(osEvents.run, self._renderer:getRun())
end

function Application:loadScene(scene)
	self._renderer:setScene(scene)
end

return Application
