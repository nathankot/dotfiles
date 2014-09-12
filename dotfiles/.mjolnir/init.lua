package.path = package.path .. ';/opt/boxen/homebrew/share/lua/5.2/?.lua'
package.cpath = package.cpath .. ';/opt/boxen/homebrew/lib/lua/5.2/?.so'

local application = require "mjolnir.application"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local fnutils = require "mjolnir.fnutils"
local geometry = require "mjolnir.geometry"
local alert = require "mjolnir.alert"

local layouts = { 'main-vertical', 'fullscreen' }
local smush = {"ctrl", "cmd"}

-- BINDINGS

hotkey.bind(smush, "r", function() mjolnir.reload(); mjolnir.openconsole() end)
hotkey.bind(smush, "c", function() cyclelayout() end)
hotkey.bind(smush, "j", function() cycle(1) end)
hotkey.bind(smush, "k", function() cycle(-1) end)
hotkey.bind(smush, "space", function() promote() end)

-- INTERNALS

local windows = {}
local layoutcycle = fnutils.cycle(layouts)
local layout = layoutcycle()

function cycle(direction)
  local windows = getwindows()
  local win = window:focusedwindow() or windows[1]
  local direction = direction or 1
  local currentindex = fnutils.indexof(windows, win)
  local nextindex = currentindex + direction

  while nextindex > #windows do
    nextindex = nextindex - #windows
  end

  while nextindex < 1 do
    nextindex = #windows + nextindex
  end

  windows[nextindex]:focus()
  apply(windows, layout)
end

function cyclelayout()
  layout = layoutcycle()
  alert.show(layout, 1)
  apply(getwindows(), layout)
end

function promote()
  local windows = getwindows()
  local win = window:focusedwindow() or windows[1]
  local i = fnutils.indexof(windows, win)
  local current = table.remove(windows, i)
  table.insert(windows, 1, current)
  win:focus()
  apply(windows, layout)
end

function apply(windows, layout)
  if layout == 'fullscreen' then
    fnutils.each(windows, function(window)
      window:maximize()
    end)
  end

  if layout == 'main-vertical' then
    local wincount = #windows

    if wincount == 1 then
      return apply(windows, 'fullscreen')
    end

    for index, win in pairs(windows) do
      local frame = win:screen():frame()

      if index == 1 then
        frame.x, frame.y = 0, 0
        frame.w = frame.w / 2
      else
        frame.x = frame.w / 2
        frame.w = frame.w / 2
        frame.h = frame.h / (wincount - 1)
        frame.y = frame.h * (index - 2)
      end

      win:setframe(frame)
    end
  end
end

function getwindows()
  all = window.visiblewindows()

  -- Remove any windows no longer around
  windows = fnutils.filter(windows, function(win)
    return fnutils.contains(all, win)
  end)

  -- Add any new windows since
  fnutils.each(all, function(win)
    if fnutils.contains(windows, win) == false then
      table.insert(windows, win)
    end
  end)

  -- Remove any bad windows
  windows = fnutils.filter(windows, function(win)
    return win:isstandard()
  end)

  return windows
end
