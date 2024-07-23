--entity
function newObj(t,px,py,pcolor)
--if t == nil then print ("newobj_nil")return end
t={}
t.x = px or 0
t.y = py or 0
t.color = pcolor or 1

return t
end

