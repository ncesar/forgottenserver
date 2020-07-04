local combat = Combat()
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_EARTH)
combat:setParameter(COMBAT_PARAM_CREATEITEM, ITEM_WILDGROWTH)

function onCastSpell(creature, variant, isHotkey)

if getPlayerStorageValue(creature, 357812) == 1  or getPlayerStorageValue(creature, 357819) == 1 then
creature:sendTextMessage(MESSAGE_INFO_DESCR, "You can't use this rune here.")
        return false
    end	
	return combat:execute(creature, variant)
end
