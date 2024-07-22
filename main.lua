function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end
 img = love.graphics.newImage("dejavu10x10_gs_tc.png")
 h = img:getHeight()
 w = img:getWidth()
 quad = love.graphics.newQuad( 0, 10, 10, 10, w,h)
end

function love.update(dt)

end  



function love.draw()
	love.graphics.draw (img,quad, 50, 50)
end