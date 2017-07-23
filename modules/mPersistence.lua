-- Module responsible for saving and loading files
class.Persistence()

function Persistence:saveSettings(dir)
  dir = dir or 'settings.cfg'
  lip.save(dir, luna.settings)
end

function Persistence:loadSettings(dir)
  dir = dir or 'settings.cfg'

  -- Check whether the specified file exists
  if love.filesystem.exists(dir) then
    local playerSettings = lip.load(dir) -- Load player settings

    -- Iterate over INI sections
    for section, sectionValue in pairs(playerSettings) do
      if type(sectionValue) == "table" then
        -- Load all fields in the section
        for settingKey, settingValue in pairs(sectionValue) do
          luna.settings[section][settingKey] = settingValue
        end
      end
    end
  end
end

function Persistence:saveGame()

end

function Persistence:loadGame()

end
