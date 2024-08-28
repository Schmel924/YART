-- inventory

Inventory = {}

Inv_mode = false

local inv_lines = 4
Selector = 1

function AddScroll(type)
table.insert(Inventory,{
name = "Scroll",
type = type,
})
end

function AddBottle()
table.insert(Inventory,{
name = "bottle",
name = "Bottle",
hp = 10,
})
end

function UseScroll(type)
	if type == "Lightning" then
		local k = FindClosestEnemy()
		local x, y = Entities[k].x, Entities[k].y
		if Gamemap_vis[x][y] then GrabLog("Lightning strikes "..k) table.remove(Entities,k) 
		else GrabLog("Lightning fizzles... NOTARGET") end
	end
end

function GrabItem()
	for k, v in ipairs(Entities) do
		if Player.x == v.x and Player.y == v.y then
			if  v.name == "Bottle" then
				AddBottle()
				table.remove(Entities, k)
			elseif v.name == "Scroll" then
				AddScroll(v.type)
				table.remove(Entities, k)
			elseif v.name == "Ladder" then
				GoToNextLvl(Level)
			end
		
		end
	end
end

function Show_inventory()
if Inv_mode then
		love.graphics.setColor(Black)
		love.graphics.rectangle("fill",1,1,Fontsize*Worldsize,Fontsize*Worldsize/2)
		love.graphics.setColor(White)
		love.graphics.rectangle("line", 1,1,Fontsize*Worldsize-1, (Fontsize*Worldsize/2)-1)
		if Selector < 1 then Selector = inv_lines end
		if Selector > inv_lines then Selector =1 end

		for i =1, inv_lines, 1 do
			love.graphics.setColor(White)
			if i == Selector then
				love.graphics.setColor(Green)
			end
			if Inventory[i] then
				love.graphics.print(Inventory[i].name,1, (Scale+Fontsize)*i, 0, Scale)
			else
			love.graphics.print("[-] Empty", 1, (Scale+Fontsize)*i,  0, Scale)
			end
			love.graphics.setColor(White)
		end
	end
end

function Toggle_inv_mod ()
	Inv_mode = not Inv_mode
	Selector = 1
end

function UseInventorySpace(sel)
	if Inventory[sel] then
		if Inventory[sel].name == "Bottle" then
				Player.hp = Player.hp + Inventory[sel].hp
				table.remove(Inventory,sel)
		elseif Inventory[sel].name == "Scroll" then
				UseScroll(Inventory[sel].type)
				table.remove(Inventory,sel)
		end
	else
		GrabLog("Pockets are empty")
	end
end
