-- keypod.lua
function love.keypressed (key,scancode, isrepeat)
if (key == 'down') then player_y = player_y+30 end
if (key == "up") then player_y=player_y-30 end
if (key=="right") then player_x = player_x+30 end 
if (key=="left") then player_x = player_x-30 end 
end