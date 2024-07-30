require("Keypod")
require("entity")
require("gamemap")

function love.load(arg)
	if arg[#arg] == "-debug" then
		require("mobdebug").start()
	end
	img = love.graphics.newImage("dejavu10x10_gs_tc.png")
	local height = img:getHeight()
	local w = img:getWidth()
	ATquad = love.graphics.newQuad(0, 10, 10, 10, w, height)
	Flquad = love.graphics.newQuad(130, 10, 10, 10, w, height)
	---@diagnostic disable-next-line: unused-local
	local _w, _h, fl = love.window.getMode()
	love.window.setTitle("Yet Another Roguelike Tutorial")
	scale = 3
	fontsize = scale * 10
	worldsize = 20
	love.window.setMode(fontsize * worldsize, fontsize * worldsize, fl)
	player = newObj(player, 5, 5)
	enemy = newObj(enemy, 3, 3)
	createmap()
end

function love.update(dt) end
-- event queue

function love.draw()
	love.graphics.draw(img, ATquad, (enemy.x - 1) * fontsize, (enemy.y - 1) * fontsize, 0, scale, scale)
	drawgamemap()
	love.graphics.draw(img, ATquad, (player.x - 1) * fontsize, (player.y - 1) * fontsize, 0, scale, scale) --draw player over everything
end
