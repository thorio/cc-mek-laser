local Class = require("lib.Class")

local EventDispatcher = Class:extend()

function EventDispatcher:init()
	self._callbacks = {}
end

function EventDispatcher:dispatch(...)
	for i, callback in ipairs(self._callbacks) do
		callback(unpack(arg))
	end
end

function EventDispatcher:on(callback)
	table.insert(self._callbacks, callback)
end

function EventDispatcher:clear(callbackToClear)
	for i, callback in ipairs(self._callbacks) do
		if (callback == callbackToClear) then
			table.remove(self._callbacks, i)
			return
		end
	end
end

function EventDispatcher:clearAll()
	self._callbacks = {}
end

function EventDispatcher:hasListeners()
	return next(self._callbacks) ~= nil
end

return EventDispatcher
