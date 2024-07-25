require ("Keypod")
require ("entity")
require ("gamemap")

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end
 img = love.graphics.newImage("dejavu10x10_gs_tc.png")
 h = img:getHeight()
 w = img:getWidth()
 ATquad = love.graphics.newQuad( 0, 10, 10, 10, w,h)
 Flquad = love.graphics.newQuad ( 130, 10, 10, 10, w,h)
 local _w,_h, fl = love.window.getMode()
 love.window.setTitle("Yet Another Roguelike Tutorial" )
 scale = 3
 fontsize = scale *10
 love.window.setMode(fontsize*20,fontsize*20,fl)
 player = newObj(player, 30,30)
 enemy = newObj(enemy, 60,60)
 createmap ()
end

function love.update(dt)

end  
-- event queue

function love.draw()
  
  love.graphics.draw (img, ATquad, enemy.x, enemy.y, 0, scale, scale)
  drawgamemap()
  love.graphics.draw (img, ATquad, player.x, player.y, 0, scale, scale) --draw player over everything
end
