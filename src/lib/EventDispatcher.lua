local Class = require("lib.Class")
local meta = require("utility.meta")

local EventDispatcher = Class:extend()

function EventDispatcher:init()
	self._callbacks = {}
end

function EventDispatcher:dispatch(...)
	for i, callback in ipairs(self._callbacks) do
		callback(unpack(arg))
	end
end

function EventDispatcher:on(callback, optionalSelf)
	local func = callback
	if optionalSelf ~= nil then
		func = meta.curry(callback, optionalSelf)
	end

	table.insert(self._callbacks, func)
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
