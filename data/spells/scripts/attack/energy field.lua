local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ENERGYDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ENERGYHIT)
combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_ENERGYBALL)
combat:setParameter(COMBAT_PARAM_CREATEITEM, ITEM_ENERGYFIELD_PVP)

function onCastSpell(creature, variant, isHotkey)
if getPlayerStorageValue(creature, 357812) == 1  or getPlayerStorageValue(creature, 357819) == 1 then
        return false
    end
	-- CAPTURE START
if creature:isPlayer() then
if captureTheFlag.getPlayerState(creature) ~= CTF_STATE_NONE then
    creature:sendTextMessage(MESSAGE_INFO_DESCR, "You can't use this rune here.")
        return false
    end
	end
-- CAPTURE END
	return combat:execute(creature, variant)
end
