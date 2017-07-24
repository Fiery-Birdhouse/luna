-- Include all states
require("states/StartSequence")

-- Include required modules
require("modules/mInputVerify")
require("modules/mPersistence")
require("modules/mLuna")


luna = Luna()

function love.load()
  -- Debug Mode
  if arg[#arg] == "-debug" then
    require("states/Debug")
    addState(DebugMode, "Debug", 10)
    enableState("Debug")
  end

	-- Add the game states for future use
	addState(StartSequence, "StartSequence")

	-- Initial game state
	enableState("StartSequence")

  -- Load settings.cfg
  Persistence:loadSettings()

  -- Update video with the players settings
  luna:updateVideo()
end

function love.update(dt)
	InputVerify:update(dt)
	lovelyMoon.update(dt)
end

function love.draw()
	lovelyMoon.draw()
end

function love.keypressed(key)
	InputVerify:keypressed(key)
end

function love.keyreleased(key)
	InputVerify:keyreleased(key)
end

function love.mousepressed(x, y, button)
	lovelyMoon.mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	lovelyMoon.mousereleased(x, y, button)
end

function love.quit()
  Persistence:saveSettings()
  return false
end
