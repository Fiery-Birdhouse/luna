class.StartSequence()

function StartSequence:load()
end

function StartSequence:close()
end

function StartSequence:enable()
end

function StartSequence:disable()
end

function StartSequence:draw()
end

function StartSequence:keypressed(key)
	if key == "console" then
			_DebugInterface.openConsole()
	end
end
