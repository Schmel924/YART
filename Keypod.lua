-- keypod.lua
function love.keypressed(key, scancode, isrepeat)
	if key == "down" then ActionDirPlayer(Player, 0, 1) end
	if key == "up" then ActionDirPlayer(Player, 0, -1) end
	if key == "right" then ActionDirPlayer(Player, 1, 0) end
	if key == "left" then ActionDirPlayer(Player, -1, 0)end
	if (key == "space") then ActionDirPlayer(Player, 0,0) end
	if key == "escape" then love.event.quit("restart") end
end
