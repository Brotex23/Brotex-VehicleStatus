ESX = exports["es_extended"]:getSharedObject()





local options = {
    {
        name = 'status',
        event = 'brotex:mainstatus',
        icon = 'fas fa-bars',
        label = Strings.Vehicle,
        groups = Brotex.Job,
        distance = 1,
    } 
}
 
local optionNames = {'status'}
  
exports.ox_target:addGlobalVehicle(options)



RegisterNetEvent('brotex:mainstatus', function()
    local ped = PlayerPedId()
    local vehicle = ESX.Game.GetClosestVehicle()
    local plate = GetVehicleNumberPlateText(vehicle)
    lib.registerContext({
        id = 'main_status',
        title = 'Vehicle: ' .. plate,
        options = {
          {
              title = Strings.StatusTitle, 
              icon = 'car',
              description = Strings.StatusDesc, 
              event = 'brotex:vehstatus', 
              arrow = true, 
          },

          {
            title = Strings.ModsTitle, 
            icon = 'sliders',
            description = Strings.ModsDesc, 
            event = 'brotex:vehmods', 
            arrow = true, 
        },
        }
      })
  
    lib.showContext('main_status')

end)


RegisterNetEvent('brotex:vehstatus', function()
    local vehicle = ESX.Game.GetClosestVehicle(vehicle)
    local fuelLevel = exports[Brotex.Fuel]:GetFuel(vehicle)
    engineHealth = GetVehicleEngineHealth(vehicle)
    bodyHealth = GetVehicleBodyHealth(vehicle)
    vehTemp = GetVehicleEngineTemperature(vehicle)
    lib.registerContext({
        id = 'vehicle_status',
        title = 'Vehicle Status',
        menu = 'main_status',
        options = {
          {
              title = 'Fuel Level', 
              icon = 'gas-pump',
              description = 'Status: ' ..math.ceil(fuelLevel) ..'.0% / 100.0%', 
          },

          {
            title = 'Engine Health', 
            icon = 'screwdriver-wrench',
            description = 'Status: ' .. math.ceil(engineHealth / 10) ..'% / 100.0%', 
          },

          {
            title = 'Body Health', 
            icon = 'gear',
            description = 'Status: ' .. math.ceil(bodyHealth / 10) ..'% / 100.0%', 
          },

          {
            title = 'Engine Temperature', 
            icon = 'temperature-three-quarters',
            description = 'Status: ' .. math.ceil(vehTemp) ..'° C', 
          },
        }
      })
  
    lib.showContext('vehicle_status')

end)


RegisterNetEvent('brotex:vehmods', function()
    local ped = PlayerPedId()
    local vehicle = ESX.Game.GetClosestVehicle(vehicle)
    local plate = GetVehicleNumberPlateText(vehicle)

    local engine = "Stock"
    local engineMod = GetVehicleMod(vehicle, 11)
    if engineMod > -1 then
        if engineMod == -1 then
            engine = "Stock"
        elseif engineMod == 0 then    
            engine = "Stage 1 Upgrade"
        elseif engineMod == 1 then
            engine = "Stage 2 Upgrade"
        elseif engineMod == 2 then
            engine = "Stage 3 Upgrade"
        elseif engineMod == 3 then
            engine = "Stage 4 Upgrade"
        end
    end

    local transmission = "Stock"
    local transMod = GetVehicleMod(vehicle, 13)
    if transMod > 0 then
        if transMod == 0 then
            transmission = "Stock"
        elseif transMod == 0 then    
            transmission = "Stage 1 Upgrade"
        elseif transMod == 1 then
            transmission = "Stage 2 Upgrade"
        elseif transMod == 2 then
            transmission = "Stage 3 Upgrade"
        end   
    end

    local suspension = "Stock"
    local susMod = GetVehicleMod(vehicle, 15)
    if susMod > -1 then
        if susMod == -1 then
            suspension = "Stock"
        elseif susMod == 0 then
            suspension = "Stage 1 Upgrade"    
        elseif susMod == 1 then
            suspension = "Stage 2 Upgrade"
        elseif susMod == 2 then
            suspension = "Stage 3 Upgrade"
        elseif susMod == 3 then
            suspension = "Stage 4 Upgrade"
        end 
    end

    local brakes = "Stock"
    local brakesMod = GetVehicleMod(vehicle, 12)
    if brakesMod > -1 then
        if brakesMod == -1 then
            brakes = "Stock"
        elseif brakesMod == 0 then
            brakes = "Stage 1 Upgrade"    
        elseif brakesMod == 1 then
            brakes = "Stage 2 Upgrade"
        elseif brakesMod == 2 then
            brakes = "Stage 3 Upgrade"
        end  
    end

    local turbo = "N/A"
    if IsToggleModOn(vehicle, 18) == 1 then
        turbo = "Turbo"
    end

    lib.registerContext({
        id = 'vehmods_status',
        title = 'Vehicle Mods Stage',
        menu = 'main_status',
        options = {
          {
              title = 'Vehicle', 
              icon = 'car',
              description = 'Plate: ' .. plate, 
          },

          {
            title = 'Engine Stage', 
            icon = 'gear',
            description = '' .. engine, 
          },

          {
            title = 'Transmission Stage', 
            icon = 'gears',
            description = '' .. transmission, 
          },

          {
            title = 'Suspension Stage', 
            icon = 'list',
            description = '' .. suspension, 
          },

          {
            title = 'Brakes', 
            icon = 'car-side',
            description = '' .. brakes, 
          },

          {
            title = 'Turbo', 
            icon = 'rocket',
            description = '' .. turbo, 
          },

        }
      })
  
    lib.showContext('vehmods_status')
end)































