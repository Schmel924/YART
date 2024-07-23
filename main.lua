require ("Keypod")
require ("entity")

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end
 img = love.graphics.newImage("dejavu10x10_gs_tc.png")
 h = img:getHeight()
 w = img:getWidth()
 quad = love.graphics.newQuad( 0, 10, 10, 10, w,h)
 local _w,_h, fl = love.window.getMode()
 love.window.setTitle("Yet Another Roguelike Tutorial" )
 love.window.setMode(600,600,fl)
 player = newObj(player, 30,30)
 enemy = newObj(enemy, 60,60)
end

function love.update(dt)

end  



function love.draw()
  love.graphics.draw (img,quad, player.x, player.y, 0, 3,3)
  love.graphics.draw (img,quad, enemy.x, enemy.y, 0, 3,3)
end
