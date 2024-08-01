--gamemap
local function newtile(t, walkable, transparent)
	--if t == nil then print ("newobj_nil")return end
	t = {}
	t.walkable = walkable or false
	t.transparent = transparent or false
	return t
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
	print(rooms[1].w)
	for k,v in pairs(rooms) do
		for i = 1,v.w do
			for j = 1,v.h do
				Gamemap[v.x+i-1][v.y+j-1] = Floor
			end
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
