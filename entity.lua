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
	t.x = t.x + dx
	t.y = t.y + dy
	MakeVisible()
end

--lets put enemies here too
Entities = {}

function GenerateAndPlaceMonsters(room)
	for i = 1, math.random(Max_monsters_per_room), 1 do
		::anotherone::
			local x = math.random(room.x,room.x2-1)
			local y = math.random(room.y, room.y2-1)
		for k, v in ipairs(Entities) do
			if v.x == x and v.y == y then print("anotherone") goto anotherone end
		end
		table.insert(Entities, {
			x = x,
			y = y,
			name = "Enemy",
			blocker = true,
			power = math.random(1,10),
		})
	end
end

function DrawEntities()
	local r,g,b,a = love.graphics.getColor()
	love.graphics.setColor(Yellow)
	for k,v in pairs(Entities) do
		if Gamemap_vis[v.x][v.y] == true then
	love.graphics.draw(ImgFont, ATquad, (v.x - 1) * Fontsize, (v.y - 1) * Fontsize, 0, Scale, Scale) --draw player over everything
		end
	end
	love.graphics.setColor(r,g,b,a)
end

function Hit(v)
table.remove(Entities,v)
GrabLog("You killed "..v)
end

local function FreeToMove(t,dx,dy)
	
	if t.x + dx < 1 or t.x + dx > Worldsize or t.y + dy < 1 or t.y + dy > Worldsize then
		return false
	end
	if Gamemap[t.x + dx][t.y + dy].walkable == false then
		return false
	end
	if dx== 0 and dy == 0 then GrabLog("Waiting...") return false end
	return true
end

local function NoEnemyInAWay(t,dx,dy)
		for _, v in pairs(Entities) do
		if v.x == t.x+dx and v.y == t.y+dy and v.blocker == true then
			if v.name == "Enemy" then Hit(_) return false
				else return false end
		end
	end
	return true
end

local function ActionDirEntity(k, dx, dy)
	if FreeToMove(Entities[k],dx,dy) and NoEnemyInAWay(Entities[k],dx,dy) then
		MoveObj(Entities[k],dx,dy)
	end
end

local function EntityMoveRandomly(k)
	dir = math.random(1,5)
	if dir == 1 then ActionDirEntity(k, 0,-1) end
	if dir == 2 then ActionDirEntity(k, 1,0) end
	if dir == 3 then ActionDirEntity(k, -1,0) end
	if dir == 4 then ActionDirEntity(k, 0,1) end
	if dir == 5 then  GrabLog(k .. "  Wanders around...") end
end


local function HitPlayer(k)
	GrabLog(k.." hits you")
	Player.hp = Player.hp - Entities[k].power
	if Player.hp <= 0 then love.event.quit("restart") end
end

local function FollowPlayer(k)
	local x = Entities[k].x
	local y = Entities[k].y
	local px = Player.x
	local py = Player.y
	if (math.abs(x-px) > math.abs(y-py)) then
		if x-px > 0 then ActionDirEntity(k, -1, 0) else ActionDirEntity(k, 1, 0) end
	else
		if y-py > 0 then ActionDirEntity(k, 0, -1) else ActionDirEntity(k, 0, 1) end
	end
end

local function EntityChaseAndAttack(k)
	GrabLog(k .. "  Bloodlust!")
	local x = Entities[k].x
	local y = Entities[k].y
	local px = Player.x
	local py = Player.y
	if (math.abs(x-px) == 1 and y-py == 0) or (x-px == 0 and math.abs(y-py) == 1) then HitPlayer(k)
	else FollowPlayer(k) 
	end
end


function EntitiesAct()
	for k,v in pairs(Entities) do
		if Gamemap_vis[v.x][v.y] == true then EntityChaseAndAttack(k)
		else
		EntityMoveRandomly(k) end
	end
end





function ActionDirPlayer(t, dx, dy)
	if FreeToMove(t,dx,dy) then
		if NoEnemyInAWay(t,dx,dy) then
	MoveObj(t,dx,dy)
	end
	end
	EntitiesAct()
end
