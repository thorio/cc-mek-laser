local meta = {}

function meta.curry(func, ...)
	local curryArgs = arg
	return function(...)
		func(unpack(curryArgs), unpack(arg))
	end
end

return meta
