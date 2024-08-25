-- SL_Module
require("Tserial")

local path = love.filesystem.getUserDirectory( )


function Save()
  Sfile = love.filesystem.newFile( "data.txt", "w" )
  Sfile:write(TSerial.pack(Gamemap))
  Sfile:write("\n\r---\n\r")
  Sfile:write(TSerial.pack(Player))
  Sfile:write("\n\r---\n\r")
  Sfile:write(TSerial.pack(Entities))
  Sfile:write("\n\r---\n\r")
  Sfile:write(TSerial.pack(Inventory))

Sfile:close()
end

function Load()
  Lfile = love.filesystem.newFile("data.txt", "r")
  local gmap = TSerial.unpack(Lfile:read())
  Gamemap = gmap
end
