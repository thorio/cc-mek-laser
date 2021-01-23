local LaserCharge = require("ui.scenes.LaserCharge")
local Application = require("Application")
local config = require("config")

local monitor = peripheral.wrap(config.monitor)
local app = Application(monitor)

app:loadScene(LaserCharge())
app:start()
