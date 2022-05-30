-- Name this file `main.lua`. Your game can use multiple source files if you wish
-- (use the `import "myFilename"` command), but the simplest games can be written
-- with just `main.lua`.

-- You'll want to import these in just about every project you'll work on.

import "CoreLibs/object"
import "CoreLibs/graphics"
import "CoreLibs/sprites"
import "CoreLibs/timer"

import "block"
import "entity"

local gfx <const> = playdate.graphics

-- Here's our player sprite declaration. We'll scope it to this file because
-- several functions need to access it.

local block = nil

-- A function to set up our game environment.

function myGameSetUp()
    block = Block(playdate.geometry.vector2D.new(64,64))
    entity.add(block)
end

-- Now we'll call the function above to configure our game.
-- After this runs (it just runs once), nearly everything will be
-- controlled by the OS calling `playdate.update()` 30 times a second.

myGameSetUp()

-- `playdate.update()` is the heart of every Playdate game.
-- This function is called right before every frame is drawn onscreen.
-- Use this function to poll input, run game logic, and move sprites.

function playdate.update()

    -- Poll the d-pad and move our player accordingly.
    -- (There are multiple ways to read the d-pad; this is the simplest.)
    -- Note that it is possible for more than one of these directions
    -- to be pressed at once, if the user is pressing diagonally.

    if playdate.buttonIsPressed( playdate.kButtonUp ) then
        block.pos += playdate.geometry.vector2D.new(0, -2)
    end
    if playdate.buttonIsPressed( playdate.kButtonRight ) then
        block.pos += playdate.geometry.vector2D.new(2, 0)
    end
    if playdate.buttonIsPressed( playdate.kButtonDown ) then
        block.pos += playdate.geometry.vector2D.new(0, 2)
    end
    if playdate.buttonIsPressed( playdate.kButtonLeft ) then
        block.pos += playdate.geometry.vector2D.new(-2, 0)
    end

    -- Call the functions below in playdate.update() to draw sprites and keep
    -- timers updated. (We aren't using timers in this example, but in most
    -- average-complexity games, you will.)

    gfx.clear()

    gfx.sprite.update()
    playdate.timer.updateTimers()

    entity.update()
    entity.draw()

end