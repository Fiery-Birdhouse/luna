-- Include some necessary libs
require 'lib/pl'
require("lib/stateManager")
require("lib/lovelyMoon")
lip = require 'lib/LIP';
tiny = require("lib/tiny")
log = require("lib/log")
dd = pretty.dump
log.level = "error"

function love.conf(t)
  t.identity = "luna"
  t.version = "11.1"
  t.window.title = "Luna Engine"
  t.externalstorage = true
end
