-- @Project: FiveM Tools
-- @License: GNU General Public License v3.0

Areas = {}
Areas.current = nil

function Add(name, value)
  Citizen.CreateThread(function()

    Areas[name] = Area(value)

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

function Current()
  return Areas.current
end

RegisterNetEvent('ft_areas:ClAdd')
AddEventHandler('ft_areas:ClAdd', function(data)
  Add(data)
end)

RegisterNetEvent('ft_areas:ClRemove')
AddEventHandler('ft_areas:ClRemove', function(name)
  Remove(name)
end)

RegisterNetEvent('ft_areas:ClEnable')
AddEventHandler('ft_areas:ClEnable', function(name, status)
  Enable(name, status)
end)

RegisterNetEvent('ft_areas:ClGenerator')
AddEventHandler('ft_areas:ClGenerator', function(data)
  Generator(data)
end)

RegisterNetEvent('ft_areas:ClCurrent')
AddEventHandler('ft_areas:ClCurrent', function(callback)
  callback(Areas.current)
end)
