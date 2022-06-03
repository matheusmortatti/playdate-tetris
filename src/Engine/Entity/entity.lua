-- entity.lua
-- defines the base class that all game entities should derive from.

import "CoreLibs/object"

class(
    "Entity",
    {
        object_timer = 0,
        state_timer = 0,
        done = false
    }
).extends()

function Entity:init(pos)
    self.pos = pos
    
    assert(self.pos)
end

function Entity:become(state)
    if self.state~=state and self.state~="dead" then
        self.state,self.state_timer=state,0
    end
end