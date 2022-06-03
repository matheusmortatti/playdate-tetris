import "CoreLibs/object"
import "Engine/Entity/entity"

class(
    'Block', 
    {
        size=playdate.geometry.vector2D.new(10,10)
    })
    .extends(Entity)

function Block:init(pos)
    self.pos=pos
end

function Block:update()

end

function Block:draw()
    playdate.graphics.drawRect(self.pos.x, self.pos.y, self.size.dx, self.size.dy)
end