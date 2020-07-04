local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
combat:setParameter(COMBAT_PARAM_AGGRESSIVE, false)

local condition = Condition(CONDITION_INVISIBLE)
condition:setParameter(CONDITION_PARAM_TICKS, 200000)
combat:setCondition(condition)

function onCastSpell(creature, variant)
-- CAPTURE START
if creature:isPlayer() then
if captureTheFlag.getPlayerState(creature) ~= CTF_STATE_NONE or Battlefield:findPlayer(creature) then
    creature:sendTextMessage(MESSAGE_INFO_DESCR, "You can't use utana vid here.")
        return false
    end
	end
-- CAPTURE END
	return combat:execute(creature, variant)
end
