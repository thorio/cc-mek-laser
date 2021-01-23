local Text = require("ui.components.Text")
local ProgressBar = require("ui.components.ProgressBar")
local Button = require("ui.components.Button")
local Scene = require("ui.scenes.Scene")

local LaserCharge = Scene:extend()

function LaserCharge:init()
	Scene.init(self)

	self.chargeText = Text("Laser Charge", vector.new(2, 1), vector.new(27, 1)):addTo(self)
	self.chargeProgress = ProgressBar(vector.new(2, 2), vector.new(27, 1)):addTo(self)
	self.chargeButton = Button("Charge", vector.new(2, 4), vector.new(12, 2)):addTo(self)
	self.fireButton = Button("Fire", vector.new(17, 4), vector.new(12, 2)):addTo(self)

	self.chargeButton.clicked:on(self.chargeButtonClick, self)
end

function LaserCharge:chargeButtonClick()
	print("clicked")
end

return LaserCharge
