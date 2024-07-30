-- keypod.lua
function love.keypressed(key, scancode, isrepeat)
	if key == "down" then
		MoveObj(Player, 0, 1)
	end
	if key == "up" then
		MoveObj(Player, 0, -1)
	end
	if key == "right" then
		MoveObj(Player, 1, 0)
	end
	if key == "left" then
		MoveObj(Player, -1, 0)
	end
	--if (key == "space") then enemy.x = math.abs(enemy.x+Player.x)/2 end
end

