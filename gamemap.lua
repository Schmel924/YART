--gamemap
local function newtile(t, walkable, transparent)
	--if t == nil then print ("newobj_nil")return end
	t = {}
	t.walkable = walkable or false
	t.transparent = transparent or false
	return t
end

local function AABB(room1,room2)
	if room1.x <= room2.x2 and room1.x2 >= room2.x and room1.y <= room2.y2 and room1.y2 >= room2.y then
		return true
	else
		return false
	end
end


local function CenterRoom(x,y,w,h)
	local cx = math.floor(w/2 + x)
	local cy = math.floor(h/2 + y)
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

local function plotXine(cy,x1,x2)
	local k = 1
	if x2 < x1 then k = -1 end
	for i = x1,x2,k do
		Gamemap[i][cy] = Floor
	end
end

local function plotVine(cx,y1,y2)
	local k = 1
	if y2 < y1 then k = -1 end
	for i = y1,y2,k do
		Gamemap[cx][i] = Floor
	end
end

local function plotline(x1,y1,x2,y2)
	local cx,cy
	if math.random() < 0.5 then
		cx = x1; cy = y2
	else
		cx = x2; cy = y1
	end
		plotVine(cx,y1,y2)
		plotXine(cy,x1,x2)
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
	t.x2=x+w;t.y2=y+h;
	t.cx, t.cy = CenterRoom(x,y,w,h)
	t.slice = innerSlice(x,y,w,h)
	return t
end

local function GenerateDungeon()
	local rooms = {}
	local room_count = 0
	while room_count <= Max_rooms  do
		::another::
		local w = math.random(Room_min_size,Room_max_size)
		local h = math.random(Room_min_size,Room_max_size)
		local x = math.random(1,Worldsize-w)
		local y = math.random(1,Worldsize-h)
		local nroom = RectangularRoom(x,y,w,h)
		local bbaa = false
		for k=1,room_count   do
			if AABB(nroom,rooms[k])  then bbaa = true break end
		end
		if bbaa then  goto another end
		room_count = room_count + 1
		nroom.count = room_count
		GenerateAndPlaceThings(nroom)
		if room_count == 1 then Player.x = nroom.cx; Player.y=nroom.cy else
	GenerateAndPlaceMonsters(nroom) end
		if room_count == Max_rooms then GenerateAndPlaceExit(nroom) end
		rooms[room_count] = nroom
		for i = nroom.x,nroom.x2-1 do
			for j =nroom.y,nroom.y2-1 do
				Gamemap[i][j] = Floor
			end
		end
		
		if rooms[room_count-1] then
			plotline(rooms[room_count].cx,rooms[room_count].cy,rooms[room_count-1].cx,rooms[room_count-1].cy)
		end
	end
end

function VisibilityMask()
	Gamemap_vis = {}
	Gamemap_prev_vis = {}
	for i = 1, Worldsize do
		Gamemap_vis[i]={}
		Gamemap_prev_vis[i] = {}
		for j = 1, Worldsize do
		Gamemap_vis[i][j] = false
		Gamemap_prev_vis[i][j]=false
		end
	end
end

function Createmap()
	Gamemap = {}
	VisibilityMask()


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
				if Gamemap_vis[i][j] == true then
						-- love.graphics.setColor(White)
				love.graphics.draw(ImgFont, Wlquad, (i - 1) * Fontsize, (j - 1) * Fontsize, 0, Scale, Scale)
				else
					if Gamemap_prev_vis[i][j] == true then
	local r,g,b,a = love.graphics.getColor()
	love.graphics.setColor(Gray)
				love.graphics.draw(ImgFont, Wlquad, (i - 1) * Fontsize, (j - 1) * Fontsize, 0, Scale, Scale)
	love.graphics.setColor(r,g,b,a)
					end
				end
			end 
			if  Gamemap[i][j] == Floor then
				if Gamemap_vis[i][j] == true then
				love.graphics.draw(ImgFont, Flquad, (i - 1) * Fontsize, (j - 1) * Fontsize, 0, Scale, Scale)
				else
					if Gamemap_prev_vis[i][j] == true then
	local r,g,b,a = love.graphics.getColor()
	love.graphics.setColor(Gray)
				love.graphics.draw(ImgFont, Flquad, (i - 1) * Fontsize, (j - 1) * Fontsize, 0, Scale, Scale)
	love.graphics.setColor(r,g,b,a)
					end
				end
			end
		end
	end
end
