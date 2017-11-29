local Class = {}
Class.__index = Class

-- partially derived and inspired from: lua-users.org/wiki/SimpleLuaClasses.html
function Class:create(base, onCreate)
  local c = {}
  c.prototype = {}
  c.__index = c

  if type(base) == 'table' then
    c.base = base
    c.__index = base
    c.prototype.__index = base.prototype
  elseif type(base) == 'function' then
    onCreate = base
    base = nil
  end

  c.create = function(classSelf, ...)
    local i = {}
    i.__index = c.prototype
    setmetatable(i, i)
    if type(onCreate) == 'function' then
      onCreate(i, ...)
    end
    return i
  end

  return c
end

return Class
