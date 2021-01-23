local Class = require("lib.Class")
local Canvas = require("ui.Canvas")
local Renderer = require("ui.Renderer")
local ClickEventArgs = require("ui.ClickEventArgs")
local osEvents = require("lib.osEvents")
local meta = require("utility.meta")
local clickType = require("ui.clickType")

local Application = Class:extend()

function Application:init(terminal, scene)
	self._terminal = terminal
	self._renderer = Renderer(Canvas(self._terminal))
	self._scene = scene

	osEvents.monitorTouch:on(self._processMonitorTouch, self)
end

function Application:addComponent(component)
	self._renderer:addComponent(component)
end

function Application:run()
	parallel.waitForAny(unpack({
		osEvents.run,
		meta.curry(self._renderer.run, self._renderer),
	}))
end

function Application:_processMonitorTouch(monitor, posX, posY)
	local point = vector.new(posX, posY)

	for index, component in ipairs(self._scene:getComponents()) do
		if (component:isPointInside(point)) then
			local eventArgs = ClickEventArgs(clickType.left, point, point - component.position)

			component.clicked:dispatch(eventArgs)
		end
	end
end

function Application:loadScene(scene)
	self._scene = scene
	self._renderer:setScene(self._scene)
end

return Application
