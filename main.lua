require("Keypod")
require("entity")
require("gamemap")

function love.load(arg)
	if arg[#arg] == "-debug" then
		require("mobdebug").start()
	end
	ImgFont = love.graphics.newImage("dejavu10x10_gs_tc.png")
	local height = ImgFont:getHeight()
	local w = ImgFont:getWidth()
	ATquad = love.graphics.newQuad(0, 10, 10, 10, w, height)
	Flquad = love.graphics.newQuad(130, 10, 10, 10, w, height)
	local _w, _h, fl = love.window.getMode()
	love.window.setTitle("Yet Another Roguelike Tutorial")
	Scale = 3
	Fontsize = Scale * 10
	Worldsize = 20
	love.window.setMode(Fontsize * Worldsize, Fontsize * Worldsize, fl)
	Player = NewObj(Player, 5, 5)
	-- enemy = newObj(enemy, 3, 3)
	Createmap()
end

function love.update(dt) end
-- event queue

function love.draw()
	--love.graphics.draw(img, ATquad, (enemy.x - 1) * Fontsize, (enemy.y - 1) * Fontsize, 0, Scale, Scale)
	Drawgamemap()
	--change color for one thing routine
	local r,g,b,a = love.graphics.getColor()
	love.graphics.setColor(1,0,0,1)
	love.graphics.draw(ImgFont, ATquad, (Player.x - 1) * Fontsize, (Player.y - 1) * Fontsize, 0, Scale, Scale) --draw player over everything
	love.graphics.setColor(r,g,b,a)
end
