local shutdownAtServerSave = true
local cleanMapAtServerSave = true

local function serverSave()
	if shutdownAtServerSave then
		Game.setGameState(GAME_STATE_SHUTDOWN)
	else
		Game.setGameState(GAME_STATE_CLOSED)

		if cleanMapAtServerSave then
			cleanMap()
		end

		Game.setGameState(GAME_STATE_NORMAL)
	end
end

local function secondServerSaveWarning()
	broadcastMessage("Server save! Server is going down witin' one minute.", MESSAGE_STATUS_WARNING)
	addEvent(serverSave, 60000)
end

local function firstServerSaveWarning()
	broadcastMessage("Server Save! Server will go down witin' 3 Minutes.", MESSAGE_STATUS_WARNING)
	addEvent(secondServerSaveWarning, 120000)
end

function onTime(interval)
	broadcastMessage("Server Save! Server will go down witin' 5 Minutes.", MESSAGE_STATUS_WARNING)
	Game.setGameState(GAME_STATE_STARTUP)
	addEvent(firstServerSaveWarning, 120000)
	return not shutdownAtServerSave
end
