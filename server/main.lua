ESX = nil

ESX = exports["es_extended"]:getSharedObject()

TriggerEvent('esx_society:registerSociety', 'winemaker', 'Winemaker', 'society_winemaker', 'society_winemaker', 'society_winemaker', {type = 'private'})

local webhooks = "https://discord.com/api/webhooks/1059848421030244352/0lZb-jCy9KtttLGYG5rEVx7mFJNsfmI39HohrYyGUIHu1DJm9yffYLy34vQs2QmalqR6"

Items = {
    Config.cervenehrozno,
    Config.bielehrozno,
    Config.ruzovehrozno
}

function RandomItem()
    return Items[math.random(#Items)]
end
  
function RandomNumber()
    return math.random(2,4)
end

RegisterNetEvent('sv:hrozno')
AddEventHandler('sv:hrozno',function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.canCarryItem(RandomItem(), RandomNumber()) then
        math.randomseed(GetGameTimer())
        xPlayer.addInventoryItem(RandomItem(), RandomNumber())
    else
        TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'error', description = TranslateCap('inv_full')})
    end
end)

RegisterNetEvent('sv:cervene')
AddEventHandler('sv:cervene',function()
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    if xPlayer.getInventoryItem(Config.cervenehrozno).count > 14 then
        xPlayer.removeInventoryItem(Config.cervenehrozno, 15)
        xPlayer.addInventoryItem(Config.cervenehroznostlacene, 5)
  
      elseif xPlayer.getInventoryItem(Config.cervenehrozno).count < 15 then
        TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'error', description = TranslateCap('need_red')})
      end
end)

RegisterNetEvent('sv:biele')
AddEventHandler('sv:biele',function()
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    if xPlayer.getInventoryItem(Config.bielehrozno).count > 14 then
        xPlayer.removeInventoryItem(Config.bielehrozno, 15)
        xPlayer.addInventoryItem(Config.bielehroznostlacene, 5)
  
      elseif xPlayer.getInventoryItem(Config.bielehrozno).count < 15 then
        TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'error', description = TranslateCap('need_white')})
      end
end)


RegisterNetEvent('sv:ruzove')
AddEventHandler('sv:ruzove',function()
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    if xPlayer.getInventoryItem(Config.ruzovehrozno).count > 14 then
        xPlayer.removeInventoryItem(Config.ruzovehrozno, 15)
        xPlayer.addInventoryItem(Config.ruzovehroznostlacene, 5)
  
      elseif xPlayer.getInventoryItem(Config.ruzovehrozno).count < 15 then
        TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'error', description = TranslateCap('need_pink')})
      end
end)

RegisterNetEvent('plnenie:cervenes')
AddEventHandler('plnenie:cervenes',function()
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    if xPlayer.getInventoryItem(Config.cervenehroznostlacene).count > 9 then
        xPlayer.removeInventoryItem(Config.cervenehroznostlacene, 10)
        xPlayer.addInventoryItem(Config.cervenaflasa, 1)
  
      elseif xPlayer.getInventoryItem(Config.cervenehroznostlacene).count < 10 then
        TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'error', description = TranslateCap('need_p_red')})
      end
end)

RegisterNetEvent('plnenie:biele')
AddEventHandler('plnenie:biele',function()
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    if xPlayer.getInventoryItem(Config.bielehroznostlacene).count > 9 then
        xPlayer.removeInventoryItem(Config.bielehroznostlacene, 10)
        xPlayer.addInventoryItem(Config.bielaflasa, 1)
  
      elseif xPlayer.getInventoryItem(Config.bielehroznostlacene).count < 10 then
        TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'error', description = TranslateCap('need_p_white')})
      end
end)

RegisterNetEvent('plnenie:ruzove')
AddEventHandler('plnenie:ruzove',function()
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    if xPlayer.getInventoryItem(Config.ruzovehroznostlacene).count > 9 then
        xPlayer.removeInventoryItem(Config.ruzovehroznostlacene, 10)
        xPlayer.addInventoryItem(Config.ruzovaflasa, 1)
  
      elseif xPlayer.getInventoryItem(Config.ruzovehroznostlacene).count < 10 then
        TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'error', description = TranslateCap('need_p_pink')})
      end
end)

RegisterNetEvent('predajs:cervene')
AddEventHandler('predajs:cervene', function()
  local xPlayer  = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "winemaker" then
  local societyAccount = nil

  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_winemaker', function(account)
    societyAccount = account
  end)

  local money = math.random(Config.Predaje.min, Config.Predaje.max)
  if xPlayer.getInventoryItem(Config.cervenaflasa).count > 9 then
    xPlayer.removeInventoryItem(Config.cervenaflasa, 10)
    if societyAccount ~= nil then
      societyAccount.addMoney(money)
      TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'inform', description = TranslateCap('paid') ..money.. ' $'})
				local connect = {
					{
						["color"] = "9109504",
						["title"] = "Predaj červeného vína",
						["description"] = "**Hráč:** " ..GetPlayerName(source).. "\n **ID:** "..xPlayer.source.."\n **Steam ID:** "..GetPlayerIdentifier(source).." \n **The company was given:** " ..money.. "$",
						["footer"] = {
						["text"] = os.date('%H:%M:%S - %d. %m. %Y', os.time()),
						["icon_url"] = "https://media.discordapp.net/attachments/1059616858606669955/1059818533791486012/T3.png",
						},
					}
				}
				
					PerformHttpRequest(webhooks, function(err, text, headers) end, 'POST', json.encode({username = "Winemaker", embeds = connect}), { ['Content-Type'] = 'application/json' })
    end

  elseif xPlayer.getInventoryItem(Config.cervenaflasa).count < 10 then
    TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'error', description = TranslateCap('red_need')})
  end
end
end)

RegisterNetEvent('predajs:biele')
AddEventHandler('predajs:biele', function()
  local xPlayer  = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "winemaker" then
  local societyAccount = nil

  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_winemaker', function(account)
    societyAccount = account
  end)

  local money = math.random(Config.Predaje.min, Config.Predaje.max)
  if xPlayer.getInventoryItem(Config.bielaflasa).count > 9 then
    xPlayer.removeInventoryItem(Config.bielaflasa, 10)
    if societyAccount ~= nil then
      societyAccount.addMoney(money)
      TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'inform', description = TranslateCap('paid') ..money.. ' $'})
				local connect = {
					{
						["color"] = "9109504",
						["title"] = "Predaj bieleho vína",
						["description"] = "**Hráč:** " ..GetPlayerName(source).. "\n **ID:** "..xPlayer.source.."\n **Steam ID:** "..GetPlayerIdentifier(source).." \n **The company was given:** " ..money.. "$",
						["footer"] = {
						["text"] = os.date('%H:%M:%S - %d. %m. %Y', os.time()),
						["icon_url"] = "https://media.discordapp.net/attachments/1059616858606669955/1059818533791486012/T3.png",
						},
					}
				}
				
					PerformHttpRequest(webhooks, function(err, text, headers) end, 'POST', json.encode({username = "Winemaker", embeds = connect}), { ['Content-Type'] = 'application/json' })
    end

  elseif xPlayer.getInventoryItem(Config.bielaflasa).count < 10 then
    TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'error', description = TranslateCap('white_need')})
  end
end
end)

RegisterNetEvent('predajs:ruzove')
AddEventHandler('predajs:ruzove', function()
  local xPlayer  = ESX.GetPlayerFromId(source)
  if xPlayer.job.name == "winemaker" then
  local societyAccount = nil

  TriggerEvent('esx_addonaccount:getSharedAccount', 'society_winemaker', function(account)
    societyAccount = account
  end)

  local money = math.random(Config.Predaje.min, Config.Predaje.max)
  if xPlayer.getInventoryItem(Config.ruzovaflasa).count > 9 then
    xPlayer.removeInventoryItem(Config.ruzovaflasa, 10)
    if societyAccount ~= nil then
      societyAccount.addMoney(money)
      TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'inform', description = TranslateCap('paid') ..money.. ' $'})
				local connect = {
					{
						["color"] = "9109504",
						["title"] = "Predaj ružového vína",
						["description"] = "**Hráč:** " ..GetPlayerName(source).. "\n **ID:** "..xPlayer.source.."\n **Steam ID:** "..GetPlayerIdentifier(source).." \n **The company was given:** " ..money.. "$",
						["footer"] = {
						["text"] = os.date('%H:%M:%S - %d. %m. %Y', os.time()),
						["icon_url"] = "https://media.discordapp.net/attachments/1059616858606669955/1059818533791486012/T3.png",
						},
					}
				}
				
					PerformHttpRequest(webhooks, function(err, text, headers) end, 'POST', json.encode({username = "Winemaker", embeds = connect}), { ['Content-Type'] = 'application/json' })
    end

  elseif xPlayer.getInventoryItem(Config.ruzovaflasa).count < 10 then
    TriggerClientEvent('ox_lib:notify', xPlayer.source, {type = 'error', description = TranslateCap('pink_need')})
  end
end
end)
