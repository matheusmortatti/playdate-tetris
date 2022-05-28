import "CoreLibs/object"

class(
    'Block', 
    {
        size=playdate.geometry.vector2D.new(10,10)
    })
    .extends()

function Block:init(pos)
    self.pos=pos
end

function Block:update()

end

function Block:draw()
    playdate.graphics.drawRect(self.pos.dx, self.pos.dy, self.size.dx, self.size.dy)
end