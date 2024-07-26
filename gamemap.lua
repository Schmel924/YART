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
    
    local _w,_h,fl = love.window.getMode()
    
    for i = 1, worldsize  do
      gamemap[i]={}
      for j = 1, worldsize do
        gamemap[i][j] = floor
        if j==3 then gamemap[i][j] = wall end 
        end end
  end 
  
  function drawgamemap()
     for i = 1, worldsize do
       for j = 0, worldsize do
         if (gamemap[i][j] == wall) then   love.graphics.draw (img,Flquad, (i-1)*fontsize, (j-1)*fontsize, 0, scale,scale) end
       end
     end
     
  end
  