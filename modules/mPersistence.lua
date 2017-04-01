-- Módulo responsável pelas operações de salvamento e carregamento de arquivos
class.Persistence()

function Persistence:saveSettings(dir)
  dir = dir or 'settings.cfg'
  lip.save(dir, luna.settings)
end

function Persistence:loadSettings(dir)
  dir = dir or 'settings.cfg'
  
  -- Verifica se o arquivo especificado existe
  if (love.filesystem.exists(dir)) then
    luna.settings = lip.load(dir)
  end
end

function Persistence:saveGame()

end

function Persistence:loadGame()

end