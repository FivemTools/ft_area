-- @Date:   2017-06-13T14:50:56+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-15T16:37:41+02:00
-- @License: GNU General Public License v3.0

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
