-- Module responsible for saving and loading files
class.Persistence()

function Persistence:saveSettings(dir)
	dir = dir or 'settings.cfg'
		success, message = lip.save(dir, luna.settings, true)

		if not success then
			log.warn(message)
		end
end

function Persistence:loadSettings(dir)
	dir = dir or 'settings.cfg'

	-- Check whether the specified file exists
	if love.filesystem.getInfo(dir) ~= nil then
		local playerSettings = lip.load(dir) -- Load player settings

		-- Iterate over INI sections
		for section, sectionValue in pairs(playerSettings) do
			if type(sectionValue) == "table" and luna.settings[section] ~= nil then
				-- Load fields in the section if it has tweakable values
				if luna.settings[section]['_tweakable'] ~= nil then
					for settingKey, settingValue in pairs(sectionValue) do
						-- Only load the key if it's tweakable
						if tablex.find(luna.settings[section]['_tweakable'], settingKey) ~= nil then
							luna.settings[section][settingKey] = settingValue
						end
					end
				end
			end
		end
	end
end

function Persistence:saveGame()

end

function Persistence:loadGame()

end
