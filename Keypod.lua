-- keypod.lua
function love.keypressed (key,scancode, isrepeat)
if (key == 'down') then moveObj(player,0,fontsize) end
if (key == "up") then moveObj(player,0,-fontsize) end
if (key=="right") then moveObj(player,fontsize,0) end 
if (key=="left") then moveObj(player,-fontsize,0) end 
if (key == "space") then enemy.x = math.abs(enemy.x+player.x)/2 end
end