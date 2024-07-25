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
    gamemap.h = _h
    gamemap.w = _w
    for i = 0, gamemap.h , fontsize do
      gamemap[i]={}
      for j = 0, gamemap.w, fontsize do
        gamemap[i][j] = floor
        if j>59 and j < 89 and i >59 and i < 210 then gamemap[i][j] = wall end 
        end end
  end 
  
  function drawgamemap()
     for i = 0, gamemap.h , fontsize do
       for j = 0, gamemap.w, fontsize do
         if (gamemap[i][j] == wall) then   love.graphics.draw (img,Flquad, i, j, 0, scale,scale) end
       end
     end
     
  end
  