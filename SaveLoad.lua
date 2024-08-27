-- SL_Module
require("Tserial")

local path = love.filesystem.getUserDirectory( )

function UnpackMap(t)
 for i=1, Worldsize do
    for j =1, Worldsize do
      if t[(Worldsize*(i-1))+j] == 'w' then
          Gamemap[i][j] = Wall
      else
          Gamemap[i][j] = Floor
       end
     end
   end
end

function UnpackPlayer(t)
  Player.x = t.x
  Player.y = t.y
end

function UnpackEnt(t)
  Entities = {}
  for i,v in ipairs(t) do
    Entities[i] = v
  end
end

function UnpackInv(t)
  Inventory = {}
  for i,v in ipairs(t) do
    Inventory[i] = v
  end
end



function Save()
  file, errorstr = love.filesystem.newFile( "data.txt", "w" )
  local t = {}
  for i=1, Worldsize do
    for j =1, Worldsize do
      if Gamemap[i][j].walkable == false then
        t[(Worldsize*(i-1))+j] = 'w'
      else
         t[(Worldsize*(i-1))+j] = 'f'
       end
     end
   end
  file:write(TSerial.pack(t))
  file:write("\n")
  file:write(TSerial.pack(Player))
  file:write("\n")
  file:write(TSerial.pack(Entities))
  file:write("\n")
  file:write(TSerial.pack(Inventory))

  file:close()
end

function Load()
local f = 1
for line in love.filesystem.lines("data.txt") do
  if f == 1 then t = TSerial.unpack(line)
    UnpackMap(t)
   end
  if f == 2 then t = TSerial.unpack(line) 
    UnpackPlayer(t)
  end
  if f == 3 then t = TSerial.unpack(line)
    UnpackEnt(t)
  end
  if f == 4 then t = TSerial.unpack(line)   
       UnpackInv(t)
  end
  f = f + 1
 end
 VisibilityMask()
 Compute(Player, Fov_radius)
end
