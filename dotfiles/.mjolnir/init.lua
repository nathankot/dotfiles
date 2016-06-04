require "os"
require "string"

local rocksfolder = string.format("%s/.luarocks", os.getenv("HOME"))
package.path  = package.path  .. string.format(";%s/share/lua/5.2/?.lua", rocksfolder)
package.path  = package.path  .. string.format(";%s/share/lua/5.2/?/init.lua", rocksfolder)
package.cpath = package.cpath .. string.format(";%s/lib/lua/5.2/?.so", rocksfolder)

local hotkey = require "mjolnir.hotkey"
local tiling = require "mjolnir.tiling"
local alert = require "mjolnir.alert"
local lockscreen = require "mjolnir.lx.lockscreen"

local mash = {"ctrl", "cmd"}
local musicmash = {"ctrl", "alt"}

tiling.set('layouts', { 'fullscreen', 'main-vertical' })

hotkey.bind(mash, "r", function() mjolnir.reload(); mjolnir.openconsole() end)
hotkey.bind(mash, "c", function() tiling.cyclelayout() end)
hotkey.bind(mash, "j", function() tiling.cycle(1) end)
hotkey.bind(mash, "k", function() tiling.cycle(-1) end)
hotkey.bind(mash, "space", function() tiling.promote() end)
hotkey.bind(mash, "s", function() lockscreen.lockscreen() end)
