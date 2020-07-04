local portals = {
	--Daram Island
	[55520] = {position = Position(32830, 32990, 6), vocation = 2, storage = 10030}, --ice
	[55521] = {position = Position(31331, 32107, 7), vocation = 2, storage = 10030}, --earth
	[55522] = {position = Position(31250, 31985, 8), vocation = 1, storage = 10030}, --fire
	[55523] = {position = Position(31220, 32103, 5), vocation = 1, storage = 10030}, --electric
}

function onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local portal = portals[item.uid]
	if not portal or player:getVocation():getBase():getId() ~= portal.vocation or player:getLevel() < 30 then
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('Only ' .. (portal.vocation == 1 and 'Sorcerers' or 'Druids') .. ' of level 30 or higher may enter this portal.', TALKTYPE_MONSTER_SAY)
		return true
	end

	player:teleportTo(portal.position)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:setStorageValue(portal.storage, 1)
	return true
end
