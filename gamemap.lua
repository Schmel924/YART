--gamemap
local function newtile(t, walkable, transparent)
	--if t == nil then print ("newobj_nil")return end
	t = {}
	t.walkable = walkable or false
	t.transparent = transparent or false
	return t
end

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
	Gamemap[x][y]=Floor
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
	Gamemap[x][y]=Floor
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

local function CenterRoom(x,y,w,h)
	local cx = w/2 + x
	local cy = h/2 + y
	return cx, cy
end

local function innerSlice(x,y,w,h)
	local t = {}
	for i =1,w do
		t[i]={}
		for j=1,h do
		t[i][j] = Gamemap[x+i-1][y+j-1]
		end
	end
	return t
end


local function RectangularRoom(x,y,w,h)
	x = x or 4
	y = y or 4
	w = w or 4
	h = h or 4
	local t = {}
	t.x = x
	t.y = y
	t.w=w
	t.h = h
	t.cx, t.cy = CenterRoom(x,y,w,h)
	t.slice = innerSlice(x,y,w,h)
	return t
end

local function GenerateDungeon()
	local rooms = {}
	rooms[1] = RectangularRoom(4,4,4,4)
	rooms[2] = RectangularRoom(8,12,4,4)
	rooms[3] = RectangularRoom(17,5,3,10)
	for k,v in pairs(rooms) do
		for i = 1,v.w do
			for j = 1,v.h do
				Gamemap[v.x+i-1][v.y+j-1] = Floor
			end
		end
		if rooms[k+1] then
			plotline(rooms[k].cx,rooms[k].cy,rooms[k+1].cx,rooms[k+1].cy)
		end
	end
end

function Createmap()
	Gamemap = {}

	Floor = newtile(Floor, true, true)
	Wall = newtile(Wall, false, false)
-- emptying map with walls, next carve rooms in them
	for i = 1, Worldsize do
		Gamemap[i] = {}
		for j = 1, Worldsize do
			Gamemap[i][j] = Wall
		end
	end
	GenerateDungeon()
end

function Drawgamemap()
	for i = 1, Worldsize do
		for j = 0, Worldsize do
			if Gamemap[i][j] == Wall then
				love.graphics.draw(ImgFont, Flquad, (i - 1) * Fontsize, (j - 1) * Fontsize, 0, Scale, Scale)
			end
		end
	end
end
