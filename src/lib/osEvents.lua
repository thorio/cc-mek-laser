local EventDispatcher = require("lib.EventDispatcher")

local osEvents = {}
local dispatchers = {}

local function addDispatcher(eventName)
	local dispatcher = EventDispatcher()
	dispatchers[eventName] = dispatcher

	return dispatcher
end

osEvents.char = addDispatcher("char")
osEvents.key = addDispatcher("key")
osEvents.keyUp = addDispatcher("key_up")
osEvents.paste = addDispatcher("paste")
osEvents.timer = addDispatcher("timer")
osEvents.alarm = addDispatcher("alarm")
osEvents.taskComplete = addDispatcher("task_complete")
osEvents.redstone = addDispatcher("redstone")
osEvents.terminate = addDispatcher("terminate")
osEvents.disk = addDispatcher("disk")
osEvents.diskEject = addDispatcher("disk_eject")
osEvents.peripheral = addDispatcher("peripheral")
osEvents.peripheralDetach = addDispatcher("peripheral_detach")
osEvents.rednetMessage = addDispatcher("rednet_message")
osEvents.modemMessage = addDispatcher("modem_message")
osEvents.httpSuccess = addDispatcher("http_success")
osEvents.httpFailure = addDispatcher("http_failure")
osEvents.mouseClick = addDispatcher("mouse_click")
osEvents.mouseUp = addDispatcher("mouse_up")
osEvents.mouseScroll = addDispatcher("mouse_scroll")
osEvents.mouseDrag = addDispatcher("mouse_drag")
osEvents.monitorTouch = addDispatcher("monitor_touch")
osEvents.monitorResize = addDispatcher("monitor_resize")
osEvents.termResize = addDispatcher("term_resize")
osEvents.turtleInventory = addDispatcher("turtle_inventory")

function osEvents.run()
	local function handleEvent(eventName, ...)
		print(eventName, unpack(arg))
		dispatchers[eventName]:dispatch(unpack(arg))
	end

	while true do
		handleEvent(os.pullEvent())
	end
end

return osEvents
