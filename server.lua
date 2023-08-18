local VORPcore = {}
local VORPinv

TriggerEvent("getCore", function(core)
    VORPcore = core
end)


VORPinv = exports.vorp_inventory:vorp_inventoryApi()

RegisterServerEvent('wk_mining:lootTumble')
AddEventHandler("wk_mining:lootTumble", function()
    local _source = source
    local User = VORPcore.getUser(_source) 
    local Character = User.getUsedCharacter         
    local r = Config.tumbleloot[math.random(1, #Config.tumbleloot)]
    local amount = math.random(1, 3)
        
    VORPinv.addItem(_source, r, amount)
	if chance >= 196 then
		VORPinv.addItem(_source, 'sapphire', 1.0)
		TriggerClientEvent("vorp:TipRight", _source, "You found a ~pa~Sapphire~q~.", 5000)
	end    
    --local player = Character.source
         
    TriggerClientEvent("vorp:TipRight", _source, "You found " .. amount .. "  ~t4~" .. r .. " ~q~.", 5000)

end)

RegisterServerEvent('wk_mining:welloot')
AddEventHandler("wk_mining:welloot", function()
    local _source = source
    local User = VORPcore.getUser(_source) 
    local Character = User.getUsedCharacter         
    local r = Config.welloot[math.random(1, #Config.welloot)]
    local amount = math.random(1, 3)
        
    VORPinv.addItem(_source, r, amount)
	if chance >= 196 then
		VORPinv.addItem(_source, 'ruby', 1.0)
		TriggerClientEvent("vorp:TipRight", _source, "You found a ~e~Ruby~q~.", 5000)
	end    
    --local player = Character.source
         
    TriggerClientEvent("vorp:TipRight", _source, "You found " .. amount .. "  ~t4~" .. r .. " ~q~.", 5000)

end)

RegisterServerEvent('wk_mining:kamaloot')
AddEventHandler("wk_mining:kamaloot", function()
    local _source = source
    local User = VORPcore.getUser(_source) 
    local Character = User.getUsedCharacter         
    local r = Config.kamaloot[math.random(1, #Config.kamaloot)]
    local amount = math.random(1, 3)
        
    VORPinv.addItem(_source, r, amount)
	if chance >= 196 then
		VORPinv.addItem(_source, 'emerald', 1.0)
		TriggerClientEvent("vorp:TipRight", _source, "You found a ~t6~Emerald~q~.", 5000)
	end
        
    --local player = Character.source
         
    TriggerClientEvent("vorp:TipRight", _source, "You found " .. amount .. "  ~t4~" .. r .. " ~q~.", 5000)

end)

RegisterServerEvent('wk_mining:anneloot')
AddEventHandler("wk_mining:anneloot", function()
    local _source = source
    local User = VORPcore.getUser(_source) 
    local Character = User.getUsedCharacter         
    local r = Config.anneloot[math.random(1, #Config.anneloot)]
    local amount = math.random(1, 3)
	local chance = math.random(1, 200)
        
    VORPinv.addItem(_source, r, amount)
    if chance >= 196 then
		VORPinv.addItem(_source, 'diamond', 1.0)
		TriggerClientEvent("vorp:TipRight", _source, "You found a ~t~Diamond~q~.", 5000)
	end
    --local player = Character.source
         
    TriggerClientEvent("vorp:TipRight", _source, "You found " .. amount .. "  ~t4~" .. r .. " ~q~.", 5000)

end)