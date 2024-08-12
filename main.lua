require("Keypod")
require("entity")
require("gamemap")
require("fov")
require("inventory")

local function createColors()
	Red = {1,0,0,1}
	Yellow = {1,1,0,1}
	White = {1,1,1,1}
	Gray = {0.5,0.5,0.5,1}
	Black = {0,0,0,1}
	Green = {0,1,0,1}
end

function love.load(arg)
	if arg[#arg] == "-debug" then
		require("mobdebug").start()
	end
	math.randomseed(os.time())
	createColors()
	Room_max_size = 8
	Room_min_size = 2
	Max_rooms = 6
	Max_items_per_room = 2
	Max_monsters_per_room = 2
	ImgFont = love.graphics.newImage("dejavu10x10_gs_tc.png")
	local height = ImgFont:getHeight()
	local w = ImgFont:getWidth()
	ATquad = love.graphics.newQuad(0, 10, 10, 10, w, height)
	Wlquad = love.graphics.newQuad(130, 10, 10, 10, w, height)
	Flquad = love.graphics.newQuad(100,20,10,10,w,height)
	BAquad = love.graphics.newQuad(10,0,10,10,w,height)
	SCquad = love.graphics.newQuad(40,0,10,10,w,height)
	-- local _w, _h, fl = love.window.getMode()
	love.window.setTitle("Yet Another Roguelike Tutorial")
	Scale = 3
	Fontsize = Scale * 10
	Worldsize = 20
	love.window.setMode(Fontsize * Worldsize, Fontsize * (Worldsize+3) )
	Player = NewObj(Player, 0,0)
	-- enemy = newObj(enemy, 3, 3)
		Player.hp = 100
	Createmap()
	Compute(Player, Fov_radius)
	LinesCount = 4
	Lines = {}
	GrabLog("Welcome to the dungeon")
end

function love.update(dt) end
-- event queue

local function renderHp()
	local r,g,b,a = love.graphics.getColor()
		love.graphics.setColor(Gray)
	love.graphics.rectangle("line", 0,Fontsize * Worldsize, Fontsize * Worldsize, Fontsize/2 )
		love.graphics.setColor(Red)
		love.graphics.rectangle("fill", 1, (Fontsize * Worldsize)+1, (Player.hp)*(Fontsize * Worldsize)/100, (Fontsize/2) - 2 )
		love.graphics.setColor(r,g,b,a)
end

function GrabLog(Newline)
	if not Lines[1] then
		--first generation
		for i = 1, LinesCount do
			Lines[i] = "~"
		end
	end

	for i = LinesCount, 2 , -1 do
			Lines[i] = Lines[i-1]
	end
	Lines[1] = Newline
end


function RenderLog()
	for i = 1 , LinesCount do
		if  Lines[i]  then 
			love.graphics.print(Lines[i], 0, Fontsize*(Worldsize+3) - i*12, 0 , 1)
		end
	end
end

function love.draw()
	--love.graphics.draw(img, ATquad, (enemy.x - 1) * Fontsize, (enemy.y - 1) * Fontsize, 0, Scale, Scale)
	Drawgamemap()
	DrawEntities()
	--change color for one thing routine
	local r,g,b,a = love.graphics.getColor()
love.graphics.setColor(Red)
	love.graphics.draw(ImgFont, ATquad, (Player.x - 1) * Fontsize, (Player.y - 1) * Fontsize, 0, Scale, Scale) --draw player over everything
	love.graphics.setColor(r,g,b,a)
	renderHp()
	love.graphics.print("HP: "..Player.hp, 0, Fontsize * Worldsize, 0, 1)
	RenderLog()
	Show_inventory() -- will not show if inventory not toggled
end
