function love.load(arg)
  if arg[#arg] == "-debug" then require("mobdebug").start() end
  x = 0
end

function love.update(dt)
x=x+dt
y = math.ceil(x)
end  
function love.draw()
  love.graphics.setColor(20,255,0,255)
  love.graphics.print("Hello", 100, 100)
  love.graphics.print(y, 150,150)
end
