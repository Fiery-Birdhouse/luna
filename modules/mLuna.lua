class.Luna()

-- Default settings
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

-- Update video settings with the values that player defined
function Luna:updateVideo()
  love.window.setMode(self.settings.video.w, self.settings.video.h, {
    fullscreen = self.settings.video.fullscreen,
    vsync = self.settings.video.vsync
  })
end
