require ("Keypod")

function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end
 img = love.graphics.newImage("dejavu10x10_gs_tc.png")
 h = img:getHeight()
 w = img:getWidth()
 quad = love.graphics.newQuad( 0, 10, 10, 10, w,h)
 local _w,_h, fl = love.window.getMode()
 love.window.setTitle("Yet Another Roguelike Tutorial" )
 love.window.setMode(500,500,fl)
 player_x = 250
 player_y = 250
end

function love.update(dt)

end  



function love.draw()
	love.graphics.draw (img,quad, player_x, player_y)
end