package.path = package.path .. ';/opt/boxen/homebrew/share/lua/5.2/?.lua'
package.cpath = package.cpath .. ';/opt/boxen/homebrew/lib/lua/5.2/?.so'

local hotkey = require "mjolnir.hotkey"
local spotify = require "mjolnir.lb.spotify"
local tiling = require "mjolnir.tiling"
local alert = require "mjolnir.alert"

local mash = {"ctrl", "cmd"}
local musicmash = {"ctrl", "alt"}

tiling.set('layouts', { 'fullscreen', 'main-vertical', 'gp-vertical' })

hotkey.bind(mash, "r", function() mjolnir.reload(); mjolnir.openconsole() end)
hotkey.bind(mash, "c", function() tiling.cyclelayout() end)
hotkey.bind(mash, "j", function() tiling.cycle(1) end)
hotkey.bind(mash, "k", function() tiling.cycle(-1) end)
hotkey.bind(mash, "space", function() tiling.promote() end)

hotkey.bind(musicmash, "space", spotify.play)
hotkey.bind(musicmash, "h", spotify.previous)
hotkey.bind(musicmash, "l", spotify.next)

-- Easily switch network location

function secure()
  os.execute('networksetup -switchtolocation Secure')
  alert.show('Using SECURE Connection', 1)
end

function insecure()
  os.execute('networksetup -switchtolocation Insecure')
  alert.show('Using INSECURE Connection', 1)
end

hotkey.bind(mash, "s", function() secure() end)
hotkey.bind(mash, "i", function() insecure() end)
