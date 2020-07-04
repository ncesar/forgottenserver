 -- ordered as in creaturescripts.xml
local events = {
	'TutorialCockroach',
	'ElementalSpheresOverlords',
	'BigfootBurdenVersperoth',
	'BigfootBurdenWarzone',
	'BigfootBurdenWeeper',
	'BigfootBurdenWiggler',
	'SvargrondArenaKill',
	'NewFrontierShardOfCorruption',
	'NewFrontierTirecz',
	'ServiceOfYalaharDiseasedTrio',
	'ServiceOfYalaharAzerus',
	'ServiceOfYalaharQuaraLeaders',
	'InquisitionBosses',
	'InquisitionUngreez',
	'KillingInTheNameOfKills',
	'MastersVoiceServants',
	'SecretServiceBlackKnight',
	'ThievesGuildNomad',
	'WotELizardMagistratus',
	'WotELizardNoble',
	'WotEKeeper',
	'WotEBosses',
	'WotEZalamon',
	'PlayerDeath',
	'AdvanceSave',
	'AdvanceRookgaard',
	'PythiusTheRotten',
	'DropLoot'
}

local function onMovementRemoveProtection(cid, oldPosition, time)
	local player = Player(cid)
	if not player then
		return true
	end

	local playerPosition = player:getPosition()
	if (playerPosition.x ~= oldPosition.x or playerPosition.y ~= oldPosition.y or playerPosition.z ~= oldPosition.z) or player:getTarget() or time <= 0 then
		player:setStorageValue(Storage.combatProtectionStorage, 0)
		return true
	end

	addEvent(onMovementRemoveProtection, 1000, cid, oldPosition, time - 1)
end

function onLogin(player)
	local loginStr = 'Welcome to ' .. configManager.getString(configKeys.SERVER_NAME) .. '!'
	if player:getLastLoginSaved() <= 0 then
		loginStr = loginStr .. ' Please choose your outfit.'
		player:sendTutorial(1)
	else
		if loginStr ~= '' then
			player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)
		end

		loginStr = string.format('Your last visit was on %s.', os.date('%a %b %d %X %Y', player:getLastLoginSaved()))
	end
	player:sendTextMessage(MESSAGE_STATUS_DEFAULT, loginStr)

	local playerId = player:getId()

	-- Stamina
	nextUseStaminaTime[playerId] = 0

	    -- fury gates
   
    if Game.getStorageValue(GlobalStorage.FuryGates, (9710)) == 1 then -- for venore
      player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Venore Today.')
elseif Game.getStorageValue(GlobalStorage.FuryGates, (9711)) == 2 then -- for ab...
      player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Abdendriel Today.')
      elseif Game.getStorageValue(GlobalStorage.FuryGates, (9712)) == 3 then -- for ab...
      player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Thais Today.')
      elseif Game.getStorageValue(GlobalStorage.FuryGates, (9713)) == 4 then -- for ab...
      player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Carlin Today.')
      elseif Game.getStorageValue(GlobalStorage.FuryGates, (9714)) == 5 then -- for ab...
      player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Edron Today.')
      elseif Game.getStorageValue(GlobalStorage.FuryGates, (9716)) == 6 then -- for ab...
     player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, 'Fury Gate is on Kazordoon Today.')
      end
	  
	-- Promotion
	local vocation = player:getVocation()
	local promotion = vocation:getPromotion()
	if player:isPremium() then
		local value = player:getStorageValue(Storage.Promotion)
		if not promotion and value ~= 1 then
			player:setStorageValue(Storage.Promotion, 1)
		elseif value == 1 then
			player:setVocation(promotion)
		end
	elseif not promotion then
		player:setVocation(vocation:getDemotion())
	end

	-- Events
	for i = 1, #events do
		player:registerEvent(events[i])
	end

	if player:getStorageValue(Storage.combatProtectionStorage) <= os.time() then
		player:setStorageValue(Storage.combatProtectionStorage, os.time() + 10)
		onMovementRemoveProtection(playerId, player:getPosition(), 10)
	end
	return true
end