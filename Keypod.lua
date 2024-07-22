-- keypod.lua
function love.keypressed (key,scancode, isrepeat)
if (key == 'down') then player_y = player_y+10 end
if (key == "up") then player_y=player_y-10 end
if (key=="right") then player_x = player_x+10 end 
if (key=="left") then player_x = player_x-10 end 
end