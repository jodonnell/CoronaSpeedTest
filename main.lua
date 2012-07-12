-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

display.setStatusBar( display.HiddenStatusBar )


local options = {width = 16, height = 32, numFrames = 1}
local imageSheet = graphics.newImageSheet( "enemy_bullet.png", options )

local imageGroup = display.newImageGroup( imageSheet )


sprites = {}
for i=1,1200 do
   sprites[i] = display.newImage(imageSheet, 1)
   imageGroup:insert( sprites[i] )
   sprites[i].x, sprites[i].y = math.random(300), math.random(490)
end

function mainGameLoop(event)
   for i=1,1200 do
      if sprites[i].y < 0 then
	 sprites[i].y = 490
      else
	 sprites[i].y = sprites[i].y - 10
      end
   end
end

Runtime:addEventListener( "enterFrame", mainGameLoop )

local fps = require("fps")
local performance = fps.PerformanceOutput.new();
performance.group.x, performance.group.y = display.contentWidth/2,  0;
performance.alpha = 1.0; -- So i
