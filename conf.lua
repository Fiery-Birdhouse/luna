-- Include some necessary libs
require 'lib/pl'
require("lib/stateManager")
require("lib/lovelyMoon")
lip = require 'lib/LIP';
tiny = require("lib/tiny")

function love.conf(t)
  t.identity = "luna"
  t.version = "0.10.2"
  t.window.title = "Luna Engine"
end
