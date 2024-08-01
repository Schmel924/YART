
--bresenham algorhitm
local function plotLineLow(x0, y0, x1, y1)
    local dx = x1 - x0
    local dy = y1 - y0
    local yi = 1
    if dy < 0 then
        yi = -1
        dy = -dy
    end
    local D = (2 * dy) - dx
    local y = y0
    for x = x0 , x1 do
	--Gamemap[x][y]=Floor
        --plot(x, y)
        if D > 0 then
            y = y + yi
            D = D + (2 * (dy - dx))
        else
            D = D + 2*dy
        end
	end
end

local function plotlineHigh(x0, y0, x1, y1)
    local dx = x1 - x0
    local dy = y1 - y0
    local xi = 1
    if dx < 0 then
        xi = -1
        dx = -dx
    end
    D = (2 * dx) - dy
    local x = x0
    for y = y0 , y1 do
        -- plot(x, y)
	--Gamemap[x][y]=Floor
        if D > 0 then
            x = x + xi
            D = D + (2 * (dx - dy))
        else
            D = D + 2*dx
        end
	end
end


local function plotline(x0,y0,x1,y1)
	if math.abs(y1-y0) < math.abs(x1-x0) then
		if x0>x1 then
		plotLineLow(x1,y1,x0,y0)
	else
		plotLineLow(x0,y0,x1,y1)
		end
	else
		if y0 > y1 then
		plotlineHigh(x1,y1,x0,y0)
	else
		plotlineHigh(x0,y0,x1,y1)
		end
	end
end


