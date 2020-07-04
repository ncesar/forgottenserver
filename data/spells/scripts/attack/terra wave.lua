local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_EARTHDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLPLANTS)
combat:setArea(createCombatArea(AREA_SQUAREWAVE5, AREADIAGONAL_SQUAREWAVE5))

function onGetFormulaValues(player, level, maglevel)
	local min = (level / 5) + (maglevel * 3.25) + 5
	local max = (level / 5) + (maglevel * 6.75) + 30
	return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

function onCastSpell(creature, variant)
if creature:isPlayer() then
		local city = CityWars.getPlayerWar(creature)
		if city and not city:onCastSpell(creature, 'areaSpell') then
			return false
		end
	end
	return combat:execute(creature, variant)
end
