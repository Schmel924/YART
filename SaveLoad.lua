-- SL_Module
require("Tserial")

local path = love.filesystem.getUserDirectory( )


function Save()
  file, errorstr = love.filesystem.newFile( "data.txt", "w" )
  file:write(TSerial.pack(Gamemap))
  file:write("\n\r---\n\r")
  file:write(TSerial.pack(Player))
  file:write("\n\r---\n\r")
  file:write(TSerial.pack(Entities))
  file:write("\n\r---\n\r")
  file:write(TSerial.pack(Inventory))

file:close()
end

function Load()
end