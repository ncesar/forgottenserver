local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)
combat:setArea(createCombatArea(AREA_WAVE6, AREADIAGONAL_WAVE6))

function onGetFormulaValues(cid, skill, attack, factor)
	local skillTotal, levelTotal = skill * attack, getPlayerLevel(cid) / 5
	return -(((skillTotal * 0.04) + 31) + (levelTotal)), -(((skillTotal * 0.08) + 45) + (levelTotal))
end

combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
