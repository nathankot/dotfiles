local hotkey = require "hs.hotkey"
local tiling = require "hs.tiling"

local log = hs.logger.new('nk', 'debug')

local function pressFunc(key)
	return function() hs.eventtap.keyStroke({}, key, 1000) end
end

local function shiftPressFunc(key)
  mods = {}
	return function() hs.eventtap.keyStroke({"shift"}, key, 1000) end
end

-- tiling:

local tilingMash = {"ctrl", "cmd"}

tiling.set('layouts', { 'fullscreen', 'main-vertical' })

hotkey.bind(tilingMash, "r", function() hs.reload(); hs.openConsole() end)
hotkey.bind(tilingMash, "c", function() tiling.cycleLayout() end)
hotkey.bind(tilingMash, "j", function() tiling.cycle(1) end)
hotkey.bind(tilingMash, "k", function() tiling.cycle(-1) end)
hotkey.bind(tilingMash, "space", function() tiling.promote() end)

-- TAB-numpad:

hotkey.bind({"alt"}, "space", pressFunc("0"))
hotkey.bind({"alt"}, "n", pressFunc("1"))
hotkey.bind({"alt"}, "m", pressFunc("2"))
hotkey.bind({"alt"}, ",", pressFunc("3"))
hotkey.bind({"alt"}, "h", pressFunc("4"))
hotkey.bind({"alt"}, "j", pressFunc("5"))
hotkey.bind({"alt"}, "k", pressFunc("6"))
hotkey.bind({"alt"}, "y", pressFunc("7"))
hotkey.bind({"alt"}, "u", pressFunc("8"))
hotkey.bind({"alt"}, "i", pressFunc("9"))
hotkey.bind({"alt"}, ".", pressFunc("."))

hotkey.bind({"alt", "shift"}, "space", shiftPressFunc("0"))
hotkey.bind({"alt", "shift"}, "n", shiftPressFunc("1"))
hotkey.bind({"alt", "shift"}, "m", shiftPressFunc("2"))
hotkey.bind({"alt", "shift"}, ",", shiftPressFunc("3"))
hotkey.bind({"alt", "shift"}, "h", shiftPressFunc("4"))
hotkey.bind({"alt", "shift"}, "j", shiftPressFunc("5"))
hotkey.bind({"alt", "shift"}, "k", shiftPressFunc("6"))
hotkey.bind({"alt", "shift"}, "y", shiftPressFunc("7"))
hotkey.bind({"alt", "shift"}, "u", shiftPressFunc("8"))
hotkey.bind({"alt", "shift"}, "i", shiftPressFunc("9"))

-- f-arrows:

farrows = {}

farrows.watcher = hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(e)
    local flags = e:getFlags()
    local keyCode = e:getKeyCode()
    local mods = {}
    if not flags.fn then return false end
    -- Support additional modifiers:
    if flags.ctrl then table.insert(mods, "ctrl") end
    if flags.cmd then table.insert(mods, "cmd") end
    if flags.alt then table.insert(mods, "alt") end
    -- H:
    if keyCode == 0x04 then
      hs.eventtap.keyStroke(mods, "left", 100)
      return true
    end
    -- J:
    if keyCode == 0x26 then
      hs.eventtap.keyStroke(mods, "down", 100)
      return true
    end
    -- K:
    if keyCode == 0x28 then
      hs.eventtap.keyStroke(mods, "up", 100)
      return true
    end
    -- L:
    if keyCode == 0x25 then
      hs.eventtap.keyStroke(mods, "right", 100)
      return true
    end
    return false
end)

farrows.watcher:start()

-- left/right shift to parens on empty shift presses

function activeFlags(flags)
  local count = 0
  for _, v in pairs(flags) do
    if v then
      count = count + 1
    end
  end
  return count
end

shiftParens = {}
shiftParens.canShiftParen = false
shiftParens.timeoutTimer = nil
shiftParens.skipStarts = false
shiftParens.skipTimer = nil

shiftParens.watcher = hs.eventtap.new({
    hs.eventtap.event.types.keyDown,
    hs.eventtap.event.types.keyUp,
    hs.eventtap.event.types.flagsChanged }, function(e)

    -- left shift: 0x38
    -- right shift: 0x3C
    local keyCode = e:getKeyCode()
    local type = e:getType()
    local isFlagsChangedType = hs.eventtap.event.types[type] == "flagsChanged"
    local flags = e:getFlags()

    -- For any other event, assume that it interrupts the shift press:
    if not isFlagsChangedType then
      shiftParens.canShiftParen = false
      return false
    end

    -- When we're outputting a parenthesis, since it uses <shift> as well, we
    -- need a way to ignore events for that particular output:
    if shiftParens.skipStarts then
      return false
    end

    -- If this is a non-shift related modifier event, interrupt the shift press:
    if activeFlags(flags) > 0 and not flags.shift then
      shiftParens.canShiftParen = false
      return false
    end

    -- If this is a modifier event where a shift key is exclusively downed,
    -- then we are in the 'shift':
    if flags.shift and activeFlags(flags) == 1 then
      shiftParens.canShiftParen = true
      -- Allow up to 100ms to release the shift
      shiftParens.timeoutTimer = hs.timer.doAfter(0.1, function() shiftParens.canShiftParen = false end)
      return true
    end

    -- If this a modifier event where the shift key has been lifted, try
    -- to output the appropriate parenthesis:
    if activeFlags(flags) == 0 and shiftParens.canShiftParen then
        shiftParens.canShiftParen = false
        local key = "9"
        if keyCode == 0x3C then key = "0" end
        shiftParens.skipStarts = true
        shiftParens.skipTimer = hs.timer.doAfter(0.2, function() shiftParens.skipStarts = false end)
        hs.eventtap.keyStroke({"shift"}, key, 100)
        return true
    end

    -- Anything else just assume an interrupt:
    shiftParens.canShiftParen = false
    return false

end)

shiftParens.watcher:start()
