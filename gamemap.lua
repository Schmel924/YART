--gamemap
function newtile(t, walkable, transparent)
--if t == nil then print ("newobj_nil")return end
t={}
t.walkable = walkable or false
t.transparent = transparent or false
print ("wall")
return t
end





  
  function createmap ()
    gamemap = {}
    floor = newtile (floor, true, true)
    wall = newtile (wall, false, false)
    gamemap.h = 600
    gamemap.w = 600
    for i = 1, gamemap.h , 30 do
      gamemap[i]={}
      for j = 1, gamemap.w, 30 do
        gamemap[i][j] = wall end end
  end 
  
  function drawgamemap()
     for i = 1, gamemap.h , 30 do
       for j = 1, gamemap.w, 30 do
         if (gamemap[i][j] == wall) then   love.graphics.draw (img,Flquad, i, j, 0, 3,3) end
       end
     end
     
  end
  