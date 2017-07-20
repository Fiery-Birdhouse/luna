-- Module responsible for saving and loading files
class.Persistence()

function Persistence:saveSettings(dir)
  dir = dir or 'settings.cfg'
  lip.save(dir, luna.settings)
end

function Persistence:loadSettings(dir)
  dir = dir or 'settings.cfg'

  -- Check whether the specified file exists
  if (love.filesystem.exists(dir)) then
    luna.settings = lip.load(dir)
  end
end

function Persistence:saveGame()

end

function Persistence:loadGame()

end
