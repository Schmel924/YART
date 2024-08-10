-- keypod.lua
function love.keypressed(key, scancode, isrepeat)
	if Inv_mode then
	if key == "down" then Selector=Selector+1 end
	if key == "up" then Selector = Selector - 1 end
	if (key == "space") then UseInventorySpace(Selector) end
	else
	if key == "down" then ActionDirPlayer(Player, 0, 1) end
	if key == "up" then ActionDirPlayer(Player, 0, -1) end
	if key == "right" then ActionDirPlayer(Player, 1, 0) end
	if key == "left" then ActionDirPlayer(Player, -1, 0)end
	if (key == "space") then ActionDirPlayer(Player, 0,0) end
	end
	if key == "escape" then love.event.quit("restart") end
	if key == 'i' then Toggle_inv_mod() end
	if key == 'o' then AddBottle() end
end
