local Text = require("ui.components.Text")
local ProgressBar = require("ui.components.ProgressBar")
local Canvas = require("ui.Canvas")
local Button = require("ui.components.Button")
local Renderer = require("ui.Renderer")
local config = require("config")

local monitor = peripheral.wrap(config.monitor)
local canvas = Canvas(monitor)
local renderer = Renderer(canvas)

Text("Laser Charge", vector.new(2, 1), vector.new(27, 1)):addTo(renderer)
ProgressBar(vector.new(2, 2), vector.new(27, 1)):addTo(renderer)
Button("Charge", vector.new(2, 4), vector.new(12, 2)):addTo(renderer)
Button("Fire", vector.new(17, 4), vector.new(12, 2)):addTo(renderer)

renderer:render(true)
