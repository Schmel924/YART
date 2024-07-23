-- keypod.lua
function love.keypressed (key,scancode, isrepeat)
if (key == 'down') then player.y = player.y+30 end
if (key == "up") then player.y=player.y-30 end
if (key=="right") then player.x = player.x+30 end 
if (key=="left") then player.x = player.x-30 end 
if (key == "space") then enemy.x = math.abs(enemy.x+player.x)/2 end
end