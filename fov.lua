--fov.lua
Fov_radius = 1
--Gamemap[Player.x-Fov_radius][Player.y-Fov_radius] is visible
--up to Gamemap[Player.x+Fov_radius][Player.y+Fov_radius]
-- recount at every move
function MakeVisible()
	for i = 1, Worldsize do
		for j= 1, Worldsize do
			if Gamemap_vis[i][j] == true then Gamemap_prev_vis[i][j] = true end
			Gamemap_vis[i][j]= false
		end
	end
	for i = -Fov_radius , Fov_radius do
		if Player.x+i == 0 then i=0 end
		if Player.x+i >Worldsize then break end
		for j = -Fov_radius , Fov_radius  do
			Gamemap_vis[Player.x+i][Player.y+j]= true
		end
	end
end

