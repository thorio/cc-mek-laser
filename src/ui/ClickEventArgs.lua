local EventArgs = require("lib.EventArgs")

local ClickEventArgs = EventArgs:extend()

function ClickEventArgs:init(clickType, position, relativePosition)
	self.type = clickType
	self.position = position
	self.relativePosition = relativePosition
end

return ClickEventArgs
