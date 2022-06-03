-- entityHandler.lua
-- defines an api to handle game entities.

import "CoreLibs/object"
import "Engine/Entity/entity"

class(
    "EntityHandler",
    {
        
    }
).extends(Entity)

function EntityHandler:init()
    self.objects = {}
end

function EntityHandler:update()
    for _, obj in pairs(self.objects) do
        if obj.update then
            obj:update()
        end

        if obj[obj.state] then
            obj[obj.state](obj)
        end
    end
 
    -- remove all entities that are marked as 'done'
    arrayRemove(self.objects, function(t, i, j)
        if t[i].done then
            if t[i].onDestruction then
                t[i]:onDestruction()
            end

            return false
        end

        return true
    end)
end

function EntityHandler:draw()
    table.sort(self.objects, function(o1, o2)
        return o1.draw_order < o1.draw_order
    end)

    for _, obj in pairs(self.objects) do
        if obj.draw then
            obj:draw()
        end
    end
end

function EntityHandler:add(e)
    assert(e:isa(Entity))
    
    table.insert(self.objects, e)
    return e
end

function arrayRemove(t, fnKeep)
    local j, n = 1, #t;

    for i=1,n do
        if (fnKeep(t, i, j)) then
            -- Move i's kept value to j's position, if it's not already there.
            if (i ~= j) then
                t[j] = t[i];
                t[i] = nil;
            end
            j = j + 1; -- Increment position of where we'll place the next kept value.
        else
            t[i] = nil;
        end
    end

    return t;
end