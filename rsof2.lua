-- BlocksLight = isTransparent
-- SetVisible = onVisible
-- getDistance = 1
--

local octants = {
	function(x,y) return x,-y end,
	function(x,y) return y,-x end,
	function(x,y) return -y,-x end,
	function(x,y) return -x,-y end,
	function(x,y) return -x,y end,
	function(x,y) return -y,x end,
	function(x,y) return y,x end,
	function(x,y) return x,y end,
}



local function Slope(Y,X)
	local t = {}
	t.X = X
	t.Y = Y
	return t
end

local function compute(octant, origin, rangeLimit, x, top, bottom)
	-- int, coordinate, int, int, Slope, Slope
	local topY, bottomY, wasOpaque, inRange, isOpaque
	while x < rangeLimit  do
		if top.X == 1 then topY = x
		else topY = math.floor(( ((x*2+1) * top.Y +top.X -1) / (top.X*2))) end
		if bottom.Y == 0 then bottomY = 0
		else bottomY = math.floor(( ((x*2 -1) * bottom.Y + bottom.X) / (bottom.X*2)))
		end
		wasOpaque = -1 -- specifically non applicable
		local y = topY
		-- print("oct#"..octant.." " .. topY .. "==" .. y .. "<>" .. bottomY)
		while y >= bottomY do
			local tx,ty = origin.x, origin.y
			local dx,dy = octants[octant](x,y)
			tx = tx + dx; ty = ty + dy
			if (rangeLimit < 0) or getDistance(tx,ty, origin) < rangeLimit then
				inRange = true else inRange = false
			end
			if inRange then onVisible(tx,ty) end
			if not inRange or not isTransparent(tx,ty) then
			isOpaque = true else isOpaque = false end
if not(x == rangeLimit) then
			if isOpaque then
			if wasOpaque == 0 then
			local newBottom = Slope(y*2+1,x*2-1)
			if (not inRange or y == bottomY) then bottom = newBottom; --break
		else
			compute(octant,origin,rangeLimit,x+1,top,newBottom) end
			end wasOpaque = 1
		else
			if wasOpaque > 0 then top = Slope(y*2+1,x*2+1) end
			wasOpaque = 0
			end
			end
			y = y-1
		end
		if not(wasOpaque == 0) then break end
		x = x +1
end
end

-- global override
function Compute(origin, rangeLimit)
	onVisible(origin.x, origin.y)
for octant = 1, 8, 1 do
	compute(octant, origin, rangeLimit, 1, Slope(1,1), Slope(0,1))
	end
end

return Compute
