--gamemap
local function newtile(t, walkable, transparent)
	--if t == nil then print ("newobj_nil")return end
	t = {}
	t.walkable = walkable or false
	t.transparent = transparent or false
	return t
end

function Createmap()
	Gamemap = {}
	Floor = newtile(Floor, true, true)
	Wall = newtile(Wall, false, false)

	for i = 1, Worldsize do
		Gamemap[i] = {}
		for j = 1, Worldsize do
			Gamemap[i][j] = Floor
			if j == 3 then
				Gamemap[i][j] = Wall
			end
		end
	end
end

function Drawgamemap()
	for i = 1, Worldsize do
		for j = 0, Worldsize do
			if Gamemap[i][j] == Wall then
				love.graphics.draw(ImgFont, Flquad, (i - 1) * Fontsize, (j - 1) * Fontsize, 0, Scale, Scale)
			end
		end
	end
end
