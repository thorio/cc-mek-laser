local strings = {}

function strings.blank(length)
	return string.rep(" ", length)
end

function strings.padLeft(str, width)
	return str .. strings.blank(width - str:len())
end

function strings.padRight(str, width)
	return strings.blank(width - str:len()) .. str
end

function strings.truncate(str, width)
	if (width <= 3) then
		return string.rep(".", width)
	end

	return str:sub(0, width - 3) .. "..."
end

function strings.fit(str, width)
	if (str:len() > width) then
		return strings.truncate(str, width)
	elseif (str:len() < width) then
		return strings.padLeft(str, width)
	end

	return str
end

function strings.center(str, width)
	local padding = width - str:len()
	local paddingLeft = math.floor(padding / 2)
	local paddingRight = padding - paddingLeft

	return strings.blank(paddingLeft) .. str .. strings.blank(paddingRight)
end

return strings
