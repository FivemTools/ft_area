-- @Date:   2017-06-14T19:01:51+02:00
-- @Project: FiveM Tools
-- @Last modified time: 2017-06-24T20:27:47+02:00
-- @License: GNU General Public License v3.0

Citizen.CreateThread(function()

  while true do

    Citizen.Wait(0)

    if NetworkIsSessionStarted() then

      local playerPed = GetPlayerPed(-1)
      local playerLocalisation = GetEntityCoords(playerPed)

      for name, area in pairs(Areas) do

        if area.enable then
          player_in = (GetDistanceBetweenCoords(area.x, area.y, area.z, playerLocalisation.x, playerLocalisation.y, playerLocalisation.z, true) < (area.weight + 0.0) and math.abs(playerLocalisation.z - area.z) <= (area.height + 0.0))

          if player_in and Areas.current ~= name then
            Areas.current = name
            area:Enter()
          elseif player_in and Areas.current == name then
            area:Active()
          elseif not player_in and Areas.current == name then
            Areas.current = nil
            area:Exit()
          end
        end

      end

    end

  end

end)
