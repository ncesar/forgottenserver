function onAdvance(cid, skill, oldlevel, newlevel)

	       	if getPlayerLevel(cid) >= 8 and getPlayerStorageValue(cid, 99963) ~= 1 then
						    doPlayerSetBalance(cid, getPlayerBalance(cid) + 2000)
						    setPlayerStorageValue(cid, 99963, 1)
						    doPlayerSendTextMessage(cid, 19, "You have received 2000 gold in your bank for advancing to Level 8.")

		    elseif getPlayerLevel(cid) >= 30 and getPlayerStorageValue(cid, 99964) ~= 1 then
						    doPlayerSetBalance(cid, getPlayerBalance(cid) + 4000)
						    setPlayerStorageValue(cid, 99964, 1)
						    doPlayerSendTextMessage(cid, 19, "You have received 4000 gold in your bank for advancing to Level 30.")

		   elseif getPlayerLevel(cid) >= 40 and getPlayerStorageValue(cid, 99965) ~= 1 then
						    doPlayerSetBalance(cid, getPlayerBalance(cid) + 8000)
						    setPlayerStorageValue(cid, 99965, 1)
						    doPlayerSendTextMessage(cid, 19, "You have received 8000 gold in your bank for advancing to Level 40.")

		     elseif getPlayerLevel(cid) >= 80 and getPlayerStorageValue(cid, 99966) ~= 1 then
						    doPlayerSetBalance(cid, getPlayerBalance(cid) + 15000)
						    setPlayerStorageValue(cid, 99966, 1)
						    doPlayerSendTextMessage(cid, 19, "You have received 15000 gold in your bank for advancing to Level 80.")

												
						    end
		    return TRUE
end