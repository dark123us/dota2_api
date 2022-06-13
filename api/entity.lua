local entity = {}

function entity:GetByName(pattern, className)
    className = className or "trigger_dota"
    pattern = pattern or '.*'
    local e = Entities:FindAllByClassname(className)
    local res = {}
    for _, v in ipairs(e) do
        local name = v:GetName()
        if name:match(pattern) then
            if res[name] == nil then
                res[name] = {}
            end
            table.insert(res[name], v)
        end
    end
    return res
end

function minmax(val1, val2)
    if val1 > val2 then
        return val2, val1
    end
    return val1, val2
end


function entity:GetBounds(ent)
    local xy1 = ent:GetAbsOrigin() + ent:GetBounds().Mins
    local xy2 = ent:GetAbsOrigin() + ent:GetBounds().Maxs
    res = {min={x=0, y=0}, max={x=0, y=0}}
    res.min.x, res.max.x = minmax(xy1.x, xy2.x)
    res.min.y, res.max.y = minmax(xy1.y, xy2.y)
    return res
end
return entity
