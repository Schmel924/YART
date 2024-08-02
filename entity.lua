--entity
function NewObj(t, px, py, pcolor)
	--if t == nil then print ("newobj_nil")return end
	t = {}
	t.x = px or 0
	t.y = py or 0
	t.color = pcolor or 1
	return t
end

function MoveObj(t, dx, dy)
	if t.x + dx < 1 or t.x + dx > Worldsize or t.y + dy < 1 or t.y + dy > Worldsize then
		return
	end
	if Gamemap[t.x + dx][t.y + dy].walkable == false then
		return
	end
	for _, v in pairs(Entities) do
		if v.x == t.x+dx and v.y == t.y+dy and v.blocker == true then return end
	end

	t.x = t.x + dx
	t.y = t.y + dy
	MakeVisible()
end

--lets put enemies here too
Entities = {}

function GenerateAndPlaceMonsters(room)
	for i = 0, math.random(Max_monsters_per_room), 1 do
		table.insert(Entities, {
			x = math.random(room.x,room.x2-1),
			y = math.random(room.y, room.y2-1),
			name = "Enemy",
			blocker = true,
		})
	end
end

function DrawEntities()

	local r,g,b,a = love.graphics.getColor()
	love.graphics.setColor(1,1,0,1)
	for k,v in pairs(Entities) do
		if Gamemap_vis[v.x][v.y] == true then
	love.graphics.draw(ImgFont, ATquad, (v.x - 1) * Fontsize, (v.y - 1) * Fontsize, 0, Scale, Scale) --draw player over everything
		end
	end
	love.graphics.setColor(r,g,b,a)
end
