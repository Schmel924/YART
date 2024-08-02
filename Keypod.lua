-- keypod.lua
function love.keypressed(key, scancode, isrepeat)
	if key == "down" then ActionDir(Player, 0, 1) end
	if key == "up" then ActionDir(Player, 0, -1) end
	if key == "right" then ActionDir(Player, 1, 0) end
	if key == "left" then ActionDir(Player, -1, 0)end
	--if (key == "space") then enemy.x = math.abs(enemy.x+Player.x)/2 end
	if key == "escape" then love.event.quit("restart") end
end
