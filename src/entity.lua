-- entity.lua
-- defines an api to handle game entities.
-- this should be the base class for every object that should interact with others in-game

import "CoreLibs/object"

entity = entity or {}
entity.objects = entity.objects or {}

class(
    "Entity",
    {
        object_timer = 0,
        state_timer = 0,
        done = false
    }
).extends()

function Entity:init()

end

function Entity:become(state)
    if self.state~=state and self.state~="dead" then
        self.state,self.state_timer=state,0
    end
end

function entity.update()
    for _, obj in pairs(entity.objects) do
        if obj.update then
            obj:update()
        end

        if obj[obj.state] then
            obj[obj.state](obj)
        end
    end
 
    -- remove all entities that are marked as 'done'
    arrayRemove(entity.objects, function(t, i, j)
        if t[i].done then
            if t[i].onDestruction then
                t[i]:onDestruction()
            end

            return false
        end

        return tonumber
    end)
end

function entity.draw()
    table.sort(entity.objects, function(o1, o2)
        return o1.draw_order < o1.draw_order
    end)

    for _, obj in pairs(entity.objects) do
        if obj.draw then
            obj:draw()
        end
    end
end

function entity.add(e)
    if e:isa(Entity) then
        table.insert(entity.objects, e)
        return e
    end

    return nil
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