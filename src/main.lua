-- Name this file `main.lua`. Your game can use multiple source files if you wish
-- (use the `import "myFilename"` command), but the simplest games can be written
-- with just `main.lua`.

-- You'll want to import these in just about every project you'll work on.

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "block"
import "Engine/Entity/entity"
import "Engine/Entity/entityHandler"

import "GameObjects/playfield"

local gfx <const> = playdate.graphics

-- Here's our player sprite declaration. We'll scope it to this file because
-- several functions need to access it.

local playfield = nil
local entityHandler = nil

-- A function to set up our game environment.

function myGameSetUp()
    entityHandler = EntityHandler()

    playfield = Playfield(playdate.geometry.point.new(10, 10), 10, 20)

    entityHandler:add(playfield)
end

-- Now we'll call the function above to configure our game.
-- After this runs (it just runs once), nearly everything will be
-- controlled by the OS calling `playdate.update()` 30 times a second.

myGameSetUp()

-- `playdate.update()` is the heart of every Playdate game.
-- This function is called right before every frame is drawn onscreen.
-- Use this function to poll input, run game logic, and move sprites.

function playdate.update()
    -- Call the functions below in playdate.update() to draw sprites and keep
    -- timers updated. (We aren't using timers in this example, but in most
    -- average-complexity games, you will.)

    gfx.clear()

    playdate.timer.updateTimers()

    entityHandler:update()
    entityHandler:draw()

end