class.Luna()

-- Propriedades padrões
local videoW, videoH = love.window.getDesktopDimensions()
Luna.settings = {
  sound = {
    sVolume = 70,
    mVolume = 80,
  },

  video = {
    w = videoW,
    h = videoH,
    vsync = true,
    fullscreen = false
  }
}

-- Atualiza propriedades de vídeo com os valores definidos pelo jogador
function Luna:updateVideo()
  love.window.setMode(self.settings.video.w, self.settings.video.h, {
    fullscreen = self.settings.video.fullscreen,
    vsync = self.settings.video.vsync
  })
end