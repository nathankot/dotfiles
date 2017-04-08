local hotkey = require "hs.hotkey"
local tiling = require "hs.tiling"

local log = hs.logger.new('nk', 'debug')
local keyCodes = hs.keycodes.map

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

tabNumpad = {}
tabNumpad.isTabDowned = false
tabNumpad.canEmitTab = false
tabNumpad.timeoutTimer = nil
tabNumpad.skipProcessing = false
tabNumpad.skipTimer = nil

tabNumpad.keyMap = {
  ["."] = ".",  ["space"] = "0",
  ["n"] = "1",  ["m"] = "2",  [","] = "3",
  ["h"] = "4",  ["j"] = "5",  ["k"] = "6",
  ["y"] = "7",  ["u"] = "8",  ["i"] = "9",
}

tabNumpad.watcher = hs.eventtap.new({
    hs.eventtap.event.types.keyDown,
    hs.eventtap.event.types.keyUp }, function(e)

    local keyCode = e:getKeyCode()
    local type = e:getType()
    local isKeyUp = hs.eventtap.event.types[type] == "keyUp"
    local flags = e:getFlags()

    if tabNumpad.skipProcessing then
      return false
    end

    -- When tab is pressed down, set isTabDowned and a timer
    -- that dictates the window in which a key up translates
    -- to the tab key:
    if keyCode == keyCodes["tab"] and not isKeyUp then
      tabNumpad.isTabDowned = true
      tabNumpad.canEmitTab = true
      tabNumpad.timeoutTimer = hs.timer.doAfter(0.1, function() tabNumpad.canEmitTab = false end)
      return true
    end

    -- When tab is lifted, emit a tab if we are within the timeout window:
    if keyCode == keyCodes["tab"] and isKeyUp then
      tabNumpad.isTabDowned = false
      if not tabNumpad.canEmitTab then return false end
      tabNumpad.skipProcessing = true
      tabNumpad.skipTimer = hs.timer.doAfter(0.07, function() tabNumpad.skipProcessing = false end)
      hs.eventtap.keyStroke({}, "tab", 10)
      return true
    end

    -- Don't bother doing anything if tab is not downed, or if
    -- we are doing a key up:
    if not tabNumpad.isTabDowned or isKeyUp then
      return false
    end

    -- Now the actual keymap:

    local mods = {}

    for orig, new in pairs(tabNumpad.keyMap) do
      if keyCode == keyCodes[orig] then
        hs.eventtap.keyStroke(mods, new, 10)
        return true
      end
    end

    return false
end)

tabNumpad.watcher:start()

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
        shiftParens.skipTimer = hs.timer.doAfter(0.07, function() shiftParens.skipStarts = false end)
        hs.eventtap.keyStroke({"shift"}, key, 10)
        return true
    end

    -- Anything else just assume an interrupt:
    shiftParens.canShiftParen = false
    return false

end)

shiftParens.watcher:start()
