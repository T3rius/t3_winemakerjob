local TSE = TriggerServerEvent
local PlayerData, Blips = {}, {}
local WinemakerBlips = {}
----------------------
-- BY  Terius#2474  --
----------------------

ESX = nil
ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer  
    blips()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    PlayerData.job = job
    delBlips()
    blips()
end)

CreateThread(function()
    for k, v in pairs(Config.Zbervina) do
    exports.ox_target:addBoxZone({
    coords = v,
    size = vec3(10, 2, 5),
    rotation = 166,
    debug = false,
    options = {
        {
            name = 'zber_hrozna',
            event = "zber:hrozna",
            icon = "fa-sharp fa-solid fa-wine-bottle",
            label = TranslateCap('zberhrozna'),
            distance = 2,
            groups = Config.Job,
            canInteract = function(entity)
                if IsEntityPlayingAnim(PlayerPedId(), 'mp_ped_interaction', 'handshake_guy_b', 3) then return false end
                return true
            end,
        }
    }
})
end
for k, v in pairs(Config.Lisovanie) do
    exports.ox_target:addBoxZone({ 
    coords = v,
    size = vec3(2, 2, 2),
    rotation = 166,
    debug = false,
    options = {
        {
            name = 'lisovanie_hrozna',
            event = "lisovanie:hrozna",
            icon = "fa-sharp fa-solid fa-wine-bottle",
            label = TranslateCap('lisovathrozno'),
            distance = 2,
            groups = Config.Job,
            canInteract = function(entity)
                if IsEntityPlayingAnim(PlayerPedId(), 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@', 'machinic_loop_mechandplayer', 3) then return false end
                return true
            end,
        }
    }
})
end
for k, v in pairs(Config.Plnenie) do
    exports.ox_target:addBoxZone({ 
    coords = v,
    size = vec3(2, 2, 2),
    rotation = 45,
    debug = false,
    options = {
        {
            name = 'plnitflase',
            event = "plnenie:flias",
            icon = "fa-sharp fa-solid fa-wine-bottle",
            label = TranslateCap('plnitflase'),
            distance = 2,
            groups = Config.Job,
            canInteract = function(entity)
                if IsEntityPlayingAnim(PlayerPedId(), 'creatures@rottweiler@tricks@', 'petting_franklin', 3) then return false end
                return true
            end,
        }
    }
})
end
for k, v in pairs(Config.Predaj) do
    exports.ox_target:addBoxZone({
    coords = v,
    size = vec3(2, 2, 2),
    rotation = 45,
    debug = false,
    options = {
        {
            name = 'Predajvina',
            event = "predaj:vina",
            icon = "fa-sharp fa-solid fa-wine-bottle",
            label = TranslateCap('predajvina'),
            distance = 2,
            groups = Config.Job,
            canInteract = function(entity)
                if IsPedActiveInScenario(PlayerPedId(), 'WORLD_HUMAN_CLIPBOARD', 1) then return false end
                return true
            end,
        }
    }
})
end
for k, v in pairs(Config.bossmenu) do
    exports.ox_target:addBoxZone({
    coords = v,
    size = vec3(2, 2, 2),
    rotation = 45,
    debug = false,
    options = {
        {
            name = 'bossmenu',
            event = "bossmenu:open",
            icon = "fa-sharp fa-solid fa-wine-bottle",
            label = TranslateCap('bossmenu'),
            distance = 2,
            groups = Config.Job,
        }
    }
})
end
end)

RegisterNetEvent('zber:hrozna')
AddEventHandler('zber:hrozna',function()
    if lib.progressBar({
        duration = 3000,
        label = TranslateCap('zbierashrozno'),
        useWhileDead = false,
        canCancel = true,
		disable = {
			move = true,
			car = true,
			combat = true,
			mouse = false
		},
        anim = {
            dict = 'mp_ped_interaction',
            clip = 'handshake_guy_b' 
        },
    }) then TSE('sv:hrozno') end
end)

RegisterNetEvent('lisovanie:hrozna', function()
    lib.registerContext({
        id = 'lisovanie_hrozna',
        title = TranslateCap('lisovanie_hrozna_menu'),
        options = {
            {
                title = TranslateCap('liscerhrozno'),
                description = TranslateCap('lis_cer_hr_need'),
                event = 'lisovanie:cervene'
            },
            {
                title = TranslateCap('lisbiehrozno'),
                description = TranslateCap('lis_bie_hr_need'),
                event = 'lisovanie:bieleho'
            },
            {
                title = TranslateCap('lisruzhrozno'),
                description = TranslateCap('lis_ruz_hr_need'),
                event = 'lisovanie:ruzoveho',
            },
        },
    })
    lib.showContext('lisovanie_hrozna')
end)

RegisterNetEvent('lisovanie:cervene')
AddEventHandler('lisovanie:cervene',function()
    if lib.progressBar({
        duration = 30000,
        label = TranslateCap('liscerhrozno'),
        useWhileDead = false,
        canCancel = true,
		disable = {
			move = true,
			car = true,
			combat = true,
			mouse = false
		},
        anim = {
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer' 
        },
    }) then TSE('sv:cervene') end
end)

RegisterNetEvent('lisovanie:bieleho')
AddEventHandler('lisovanie:bieleho',function()
    if lib.progressBar({
        duration = 30000,
        label = TranslateCap('lisbiehrozno'),
        useWhileDead = false,
        canCancel = true,
		disable = {
			move = true,
			car = true,
			combat = true,
			mouse = false
		},
        anim = {
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer' 
        },
    }) then TSE('sv:biele') end
end)

RegisterNetEvent('lisovanie:ruzoveho')
AddEventHandler('lisovanie:ruzoveho',function()
    if lib.progressBar({
        duration = 30000,
        label = TranslateCap('lisruzhrozno'),
        useWhileDead = false,
        canCancel = true,
		disable = {
			move = true,
			car = true,
			combat = true,
			mouse = false
		},
        anim = {
            dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@',
            clip = 'machinic_loop_mechandplayer' 
        },
    }) then TSE('sv:ruzove') end
end)

RegisterNetEvent('plnenie:flias', function()
    lib.registerContext({
        id = 'plnenie_flias',
        title = TranslateCap('plnenie_flias'),
        options = {
            {
                title = TranslateCap('red_wine'),
                description = TranslateCap('red_wine_need'),
                event = 'plnenie:cervene'
            },
            {
                title = TranslateCap('white_wine'),
                description = TranslateCap('white_wine_need'),
                event = 'plnenie:bieleho'
            },
            {
                title = TranslateCap('pink_wine'),
                description = TranslateCap('pink_wine_need'),
                event = 'plnenie:ruzoveho',
            },
        },
    })
    lib.showContext('plnenie_flias')
end)

RegisterNetEvent('plnenie:cervene')
AddEventHandler('plnenie:cervene',function()
    if lib.progressBar({
        duration = 30000,
        label = TranslateCap('plnis_flasu'),
        useWhileDead = false,
        canCancel = true,
		disable = {
			move = true,
			car = true,
			combat = true,
			mouse = false
		},
        anim = {
            dict = 'creatures@rottweiler@tricks@',
            clip = 'petting_franklin' 
        },
    }) then TSE('plnenie:cervenes') end
end)

RegisterNetEvent('plnenie:bieleho')
AddEventHandler('plnenie:bieleho',function()
    if lib.progressBar({
        duration = 30000,
        label = TranslateCap('plnis_flasu'),
        useWhileDead = false,
        canCancel = true,
		disable = {
			move = true,
			car = true,
			combat = true,
			mouse = false
		},
        anim = {
            dict = 'creatures@rottweiler@tricks@',
            clip = 'petting_franklin' 
        },
    }) then TSE('plnenie:biele') end
end)

RegisterNetEvent('plnenie:ruzoveho')
AddEventHandler('plnenie:ruzoveho',function()
    if lib.progressBar({
        duration = 30000,
        label = TranslateCap('plnis_flasu'),
        useWhileDead = false,
        canCancel = true,
		disable = {
			move = true,
			car = true,
			combat = true,
			mouse = false
		},
        anim = {
            dict = 'creatures@rottweiler@tricks@',
            clip = 'petting_franklin' 
        },
    }) then TSE('plnenie:ruzove') end
end)

RegisterNetEvent('predaj:vina', function()
    lib.registerContext({
        id = 'predaj_vina',
        title = TranslateCap('predaj_vina'),
        options = {
            {
                title = TranslateCap('predaj_cer_vina'),
                description = TranslateCap('predaj_cer_vina_need'),
                event = 'predaj:cervene'
            },
            {
                title = TranslateCap('predaj_bie_vina'),
                description = TranslateCap('predaj_bie_vina_need'),
                event = 'predaj:bieleho'
            },
            {
                title = TranslateCap('predaj_ruz_vina'),
                description = TranslateCap('predaj_ruz_vina_need'),
                event = 'predaj:ruzoveho',
            },
        },
    })
    lib.showContext('predaj_vina')
end)

RegisterNetEvent('predaj:cervene')
AddEventHandler('predaj:cervene',function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_CLIPBOARD', 0, true)
    if lib.progressBar({
        duration = 10000,
        label = TranslateCap('predavas_cer_vino'),
        useWhileDead = false,
        canCancel = true,
		disable = {
			move = true,
			car = true,
			combat = true,
			mouse = false
		},
    }) then if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),  -689.4144, 5789.0386, 17.3310, true) < 50 then
        TSE('predajs:cervene')
    else
        TSE('predaj')
    end 
    end
    ClearPedTasks(playerPed) 
end)

RegisterNetEvent('predaj:bieleho')
AddEventHandler('predaj:bieleho',function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_CLIPBOARD', 0, true)
    if lib.progressBar({
        duration = 10000,
        label = TranslateCap('predavas_bie_vino'),
        useWhileDead = false,
        canCancel = true,
		disable = {
			move = true,
			car = true,
			combat = true,
			mouse = false
		},
    }) then if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),  -689.4144, 5789.0386, 17.3310, true) < 50 then
        TSE('predajs:biele')
    else
        TSE('predaj')
    end 
    end
    ClearPedTasks(playerPed) 
end)

RegisterNetEvent('predaj:ruzoveho')
AddEventHandler('predaj:ruzoveho',function()
    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_CLIPBOARD', 0, true)
    if lib.progressBar({
        duration = 10000,
        label = TranslateCap('predavas_ruz_vino'),
        useWhileDead = false,
        canCancel = true,
		disable = {
			move = true,
			car = true,
			combat = true,
			mouse = false
		},
    }) then if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)),  -689.4144, 5789.0386, 17.3310, true) < 50 then
        TSE('predajs:ruzove')
    else
        TSE('predaj')
    end 
    end
    ClearPedTasks(playerPed) 
end)

RegisterNetEvent('bossmenu:open', function()
    if zone == 'BossActions' and PlayerData.job.grade_name == 'boss' then
        CurrentAction     = 'menu_boss_actions'
        CurrentActionData = {}
      end
    TriggerEvent('esx_society:openBossMenu', 'winemaker', function(data, menu)
        
        menu.close()
        CurrentAction = 'menu_boss_actions'
        CurrentActionData = {}
        end,options)
end)


CreateThread(function()
    local pedmodel = GetHashKey(Config.PedGarage)
    RequestModel(pedmodel)
	while not HasModelLoaded(pedmodel) do
		Citizen.Wait(1)
	end	
    for _, item in pairs(Config.Garageped) do
        npc = CreatePed(1, pedmodel, item.x, item.y, item.z, item.h, false, true)

        FreezeEntityPosition(npc, true)
        SetEntityHeading(npc, item.h)
        SetEntityInvincible(npc, true)
        SetBlockingOfNonTemporaryEvents(npc, true)
        exports.ox_target:addLocalEntity(npc, {
            {
                name = 'Config_garage',
                event = 'garage:menu',
                icon = 'fa-sharp fa-solid fa-wine-bottle',
                label = TranslateCap('garage'),
                distance = 2,
		groups = Config.Job,
            }
        }
        )    
    end
end)

RegisterNetEvent('garage:menu', function()
    lib.registerContext({
        id = 'Configgarage',
        title = TranslateCap('garage'),
        options = {
            {
                title = 'Van',
                event = 'garage:van'
            },
            {
                title = 'Pick-UP',
                event = 'garage:pickup'
            },
	    {
                title = 'Return car',
                event = 'garage:returnVehicle'
            }
        },
    })
    	lib.showContext('Configgarage')
end)

RegisterNetEvent('garage:van')
AddEventHandler('garage:van',function()
    ESX.Game.SpawnVehicle('burrito', vec3(-1919.8474, 2052.8503, 140.7303), 257.0, function(vehicle)
    end)
end)

RegisterNetEvent('garage:pickup')
AddEventHandler('garage:pickup',function()
    ESX.Game.SpawnVehicle('bison3', vec3(-1919.8474, 2052.8503, 140.7303), 257.0, function(vehicle)
    end)
end)

RegisterNetEvent('garage:returnVehicle')
AddEventHandler('garage:returnVehicle', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)
    if DoesEntityExist(vehicle) then
        ESX.Game.DeleteVehicle(vehicle)
        ESX.ShowNotification("Successfully returned car.")
    else
        ESX.ShowNotification("You're not in a vehicle.")
    end
end)

function blips()
	
    if PlayerData.job ~= nil and PlayerData.job.name == 'winemaker' then
  
        for k,v in pairs(Config.Blips) do
          local blipCoord = AddBlipForCoord(v.Pos.x, v.Pos.y, v.Pos.z)
  
          SetBlipSprite (blipCoord, 85)
          SetBlipDisplay(blipCoord, 4)
          SetBlipScale  (blipCoord, 0.8)
          SetBlipColour (blipCoord, 7)
          SetBlipAsShortRange(blipCoord, true)
  
          BeginTextCommandSetBlipName("STRING")
          AddTextComponentString(v.BlipName)
          EndTextCommandSetBlipName(blipCoord)
        end
      end
  end
  
  function delBlips()
      if WinemakerBlips[1] ~= nil then
          for i=1, #WinemakerBlips, 1 do
          RemoveBlip(WinemakerBlips[i])
          WinemakerBlips[i] = nil
          end
      end
  end
  
