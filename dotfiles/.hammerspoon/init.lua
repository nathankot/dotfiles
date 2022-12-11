local hotkey = require "hs.hotkey"
local tiling = require "hs.tiling"
local window = require "hs.window"

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

hotkey.bind({"ctrl", "command"}, "return", function()
    local win = window.focusedWindow()
    win:maximize()
end)


hotkey.bind({"ctrl"}, "return", function()
  local terminal = hs.application.find('kitty')
  if terminal:isFrontmost() then
    terminal:hide()
  else
    hs.application.launchOrFocus("/Applications/kitty.app")
  end
end)

hotkey.bind({"ctrl", "shift"}, "return", function()
  local terminal = hs.application.find('Obsidian')
  if terminal:isFrontmost() then
    terminal:hide()
  else
    hs.application.launchOrFocus("/Applications/Obsidian.app")
  end
end)
