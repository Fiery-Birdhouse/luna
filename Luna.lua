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
    vsync = true
  }
}

function Luna:_init()
	self:loadSettings()
end

function Luna:loadSettings()
  self.settings = lip.load('settings.cfg')
end

function Luna:saveSettings()
  lip.save('settings.cfg', self.settings)
end

function Luna:updateVideo()
  love.window.setMode(self.settings.video.w, self.settings.video.h, {vsync = self.settings.video.vsync})
end