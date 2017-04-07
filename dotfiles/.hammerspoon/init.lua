local hotkey = require "hs.hotkey"
local tiling = require "hs.tiling"

local mash = {"ctrl", "cmd"}

tiling.set('layouts', { 'fullscreen', 'main-vertical' })

hotkey.bind(mash, "r", function() hs.reload(); hs.openConsole() end)
hotkey.bind(mash, "c", function() tiling.cycleLayout() end)
hotkey.bind(mash, "j", function() tiling.cycle(1) end)
hotkey.bind(mash, "k", function() tiling.cycle(-1) end)
hotkey.bind(mash, "space", function() tiling.promote() end)

local function pressFn(key)
  mods = {}
	return function() hs.eventtap.keyStroke(mods, key, 1000) end
end

hotkey.bind({"alt"}, "space", pressFn("0"))
hotkey.bind({"alt"}, "n", pressFn("1"))
hotkey.bind({"alt"}, "m", pressFn("2"))
hotkey.bind({"alt"}, ",", pressFn("3"))
hotkey.bind({"alt"}, "h", pressFn("4"))
hotkey.bind({"alt"}, "j", pressFn("5"))
hotkey.bind({"alt"}, "k", pressFn("6"))
hotkey.bind({"alt"}, "y", pressFn("7"))
hotkey.bind({"alt"}, "u", pressFn("8"))
hotkey.bind({"alt"}, "i", pressFn("9"))
