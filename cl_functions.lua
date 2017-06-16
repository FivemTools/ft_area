-- @Date:   2017-06-14T18:57:49+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-15T16:36:55+02:00
-- @License: GNU General Public License v3.0

Areas = {}

function Add(name, area)
  Citizen.CreateThread(function()

    Areas[name] = Area(area)

  end)
end

function Remove(name)
  Citizen.CreateThread(function()

    Areas[name] = nil

  end)
end

function Enable(name, status)
  Citizen.CreateThread(function()

    Areas[name].enable = status

  end)
end

function Generator(data)
  Citizen.CreateThread(function()

    if type(data) == "table" then
      for name, value in pairs(data) do
        Add(name, value)
      end
    end

  end)
end
