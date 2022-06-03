-- playfield.lua
-- defines the base class that all game entities should derive from.

import "CoreLibs/object"
import "Engine/Entity/entity"

class(
    "Playfield",
    {
        block_size = playdate.geometry.vector2D.new(10,10)
    }
).extends(EntityHandler)

function Playfield:init(pos, width, height)
    Playfield.super.init(self, pos)

    self.pos = pos

    self.width = width * self.block_size.x
    self.height = height * self.block_size.y

    self.draw_image = playdate.graphics.image.new(
        self.width, self.height
    )
end

function Playfield:update()
    Playfield.super.update(self)
end

function Playfield:draw()
    playdate.graphics.pushContext(self.draw_image)
    
    self.draw_image:clear(playdate.graphics.kColorWhite)
    Playfield.super.draw(self)
    playdate.graphics.drawRoundRect(
        0, 0,
        self.width, self.height,
        10
    )

    playdate.graphics.popContext()

    self.draw_image:draw(
        self.pos.x, self.pos.y
    )
end