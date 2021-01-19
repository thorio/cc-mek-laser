local Text = require("ui.components.Text")
local ProgressBar = require("ui.components.ProgressBar")
local Application = require("Application")
local Button = require("ui.components.Button")
local config = require("config")

local monitor = peripheral.wrap(config.monitor)
local app = Application(monitor)

Text("Laser Charge", vector.new(2, 1), vector.new(27, 1)):addTo(app)
ProgressBar(vector.new(2, 2), vector.new(27, 1)):addTo(app)
Button("Charge", vector.new(2, 4), vector.new(12, 2)):addTo(app)
Button("Fire", vector.new(17, 4), vector.new(12, 2)):addTo(app)

app:start()
