local collision = {}

local function betweenInclusive(num, min, max)
	return num >= min and num <= max
end

function collision.pointInRect(point, position, size)
	return betweenInclusive(point.x, position.x, position.x + size.x) and betweenInclusive(point.y, position.y, position.y + size.y)
end

return collision
