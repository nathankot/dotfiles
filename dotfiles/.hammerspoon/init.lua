local hotkey = require "hs.hotkey"
local tiling = require "hs.tiling"

local log = hs.logger.new('nk', 'debug')
local keyCodes = hs.keycodes.map

-- tiling:

local tilingMash = {"ctrl", "cmd"}

tiling.set('layouts', { 'fullscreen', 'main-vertical' })

hotkey.bind(tilingMash, "r", function() hs.reload(); hs.openConsole() end)
hotkey.bind(tilingMash, "c", function() tiling.cycleLayout() end)
hotkey.bind(tilingMash, "j", function() tiling.cycle(1) end)
hotkey.bind(tilingMash, "k", function() tiling.cycle(-1) end)
hotkey.bind(tilingMash, "space", function() tiling.promote() end)
hotkey.bind({"ctrl"}, "return", function()
  local alacritty = hs.application.find('alacritty')
  if alacritty:isFrontmost() then
    alacritty:hide()
  else
    hs.application.launchOrFocus("/Applications/Alacritty.app")
  end
end)
