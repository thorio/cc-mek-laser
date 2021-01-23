local Text = require("ui.components.Text")
local ProgressBar = require("ui.components.ProgressBar")
local Button = require("ui.components.Button")
local Scene = require("ui.scenes.Scene")

local LaserCharge = Scene:extend()

function LaserCharge:init()
	Scene.init(self)

	Text("Laser Charge", vector.new(2, 1), vector.new(27, 1)):addTo(self)
	ProgressBar(vector.new(2, 2), vector.new(27, 1)):addTo(self)
	Button("Charge", vector.new(2, 4), vector.new(12, 2)):addTo(self)
	Button("Fire", vector.new(17, 4), vector.new(12, 2)):addTo(self)
end

return LaserCharge
