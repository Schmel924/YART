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
	if Gamemap[t.x + dx][t.y + dy] == Wall then
		return
	end
	t.x = t.x + dx
	t.y = t.y + dy
end
