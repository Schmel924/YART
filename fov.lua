--fov.lua
Fov_radius = 4
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
	--for i = -Fov_radius , Fov_radius do
	--	if Player.x+i < 1 then i=0 end
	--	if Player.x+i >Worldsize then break end
	--	for j = -Fov_radius , Fov_radius  do
	--		Gamemap_vis[Player.x+i][Player.y+j]= true
	--	end
	--end
	px,py = Player.x, Player.y
	Sfov(Player, Fov_radius)
end

--second FOV attempt
Sfov = require 'rsof2'
	-- Required callbacks:
	function isTransparent(x,y)
	-- return true if the cell is non-blocking
		if x>0 and x<Worldsize+1 and y>0 and y <Worldsize+1 then
		return Gamemap[x][y].transparent
	else return false end
	end

	function onVisible(x,y)
		-- gets called when a square is visible
		if x>0 and x<Worldsize+1 and y>0 and y <Worldsize+1 then
		Gamemap_vis[x][y] = true
	end
	end
	
	function getDistance(x,y,origin)
	return math.sqrt( (origin.x-x)^2+(origin.y - y)^2)
	end

	-- Required:
	radius        = Fov_radius   -- sight radius
	px,py         = 0,0-- position of light origin
	
	-- Optional:
	start_angle   = 0         -- starting angle for FOV arc
	last_angle    = math.pi*2 -- last angle for FOV arc
	                          -- default: 360 degrees FOV
	permissiveness= 10 -- 0-10, 10 being perfectly symmetric FOV
	                   -- default: 10
	                   -- not available for Recursive Shadowcasting
	-- Calculate fov:
	--Sfov(px,py,radius,isTransparent,onVisible,
	--start_angle,last_angle,pPlayer.x,Player.y ermissiveness)
