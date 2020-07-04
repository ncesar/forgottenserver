local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_GROUNDSHAKER)
combat:setParameter(COMBAT_PARAM_BLOCKARMOR, true)
combat:setParameter(COMBAT_PARAM_USECHARGES, true)
combat:setArea(createCombatArea(AREA_CIRCLE3X3))

function onGetFormulaValues(cid, skill, attack, factor)
	local skillTotal, levelTotal = skill * attack, getPlayerLevel(cid) / 5
	return -(((skillTotal * 0.02) + 4) + (levelTotal)), -(((skillTotal * 0.03) + 6) + (levelTotal))
end


combat:setCallback(CALLBACK_PARAM_SKILLVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
