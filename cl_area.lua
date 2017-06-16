-- @Date:   2017-06-15T16:30:17+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-16T18:18:43+02:00
-- @License: GNU General Public License v3.0

-- Constructor
Area = {}
Area.__index = Area

-- Meta table for users
setmetatable(Area, {
  __call = function(self, data)
    local p = {}
    p.x = data.x or 0.0
    p.y = data.y or 0.0
    p.z = data.z or 0.0
    p.enable = data.enable or false
    p.weight = data.weight or 2.0
    p.height = data.height or 2.0
    p.enter = {}
    p.exit = {}
    p.active = {}
    return setmetatable(p, Area)
  end
})

function Area:Enter()
  Citizen.CreateThread(function()

    if self.enter.callback ~= nil then
      local callback = self.enter.callback
      callback()
    end

    if self.enter.eventClient ~= nil then
      local callback = self.enter.callback
      callback()
    end

    if self.enter.eventServer ~= nil then
      local callback = self.enter.callback
      callback()
    end

  end)
end

function Area:Active()
  Citizen.CreateThread(function()

    if self.active.callBack ~= nil then
      self.active.callBack()
    end

    if self.active.eventClient ~= nil then
      local callback = self.active.callback
      callback()
    end

    if self.active.eventServer ~= nil then
      local callback = self.active.callback
      callback()
    end

  end)
end

function Area:Exit()
  Citizen.CreateThread(function()

    if self.exit.callBack ~= nil then
      self.exit.callBack()
    end

    if self.exit.eventClient ~= nil then
      local callback = self.exit.callback
      callback()
    end

    if self.exit.eventServer ~= nil then
      local callback = self.exit.callback
      callback()
    end

  end)
end
