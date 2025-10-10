require("hs.ipc")

function launchITerm()
  hs.application.launchOrFocus("iTerm")
  hs.application.get("Code"):hide()
end

function launchVisualStudioCode()
  hs.application.launchOrFocus("Visual Studio Code")
  hs.application.get("iTerm"):hide()
end
function hs.executeTerminal(s)
  iterm = hs.application("iTerm")
  iterm:activate()
  iterm:selectMenuItem({ "Shell", "New Tab" })
  hs.eventtap.keyStrokes("exec " .. s)
  hs.eventtap.keyStroke({}, "return")
end

function toggleUnity()
  local currentApp = hs.window.focusedWindow():application()
  if currentApp:name() == "Unity" then
    hs.application.get("Unity"):hide()
  else
    local apps = hs.application.runningApplications()
    for _, app in ipairs(apps) do
      if app:name() == "Unity" then
        app:activate()
        break
      end
    end
  end
end
hs.window.animationDuration = 0.1

hs.hotkey.bind({ "ctrl", "cmd" }, "r", function()
  hs.reload()
end)

hs.hotkey.bind({ "ctrl", "cmd" }, "T", function()
  iterm = hs.application("iTerm")
  iterm:activate()
  iterm:selectMenuItem({ "Shell", "New Window" })
end)

hs.hotkey.bind({ "ctrl", "cmd" }, "L", function()
  iterm = hs.application("iTerm")
  iterm:activate()
  iterm:selectMenuItem({ "Shell", "New Tab" })
  hs.eventtap.keyStrokes("exec /usr/local/bin/exec-in ~/code/lab-notes /Users/charles/bin/nvim lab.md")
  hs.eventtap.keyStroke({}, "return")
end)

hs.hotkey.bind({ "ctrl", "cmd" }, "Z", function()
  hs.executeTerminal("/usr/local/bin/exec-in ~/ /Users/charles/bin/nvim ~/.zshrc")
end)

hs.hotkey.bind({ "ctrl", "cmd" }, "forwarddelete", function()
  hs.execute("pmset sleepnow")
end)


hiddenApplications = {}

function reverse(x)
  rev = {}
  for i = #x, 1, -1 do
    rev[#rev + 1] = x[i]
  end
  return rev
end

-- keybinding to toggle all apps
hs.hotkey.bind({ "ctrl", "cmd" }, "A", function()
  local visible = {}

  for _, window in ipairs(hs.window.visibleWindows()) do
    if window:application():name() ~= "Finder" then
      table.insert(visible, window)
    end
  end

  if #visible == 0 then
    for _, app in ipairs(reverse(hiddenApplications)) do
      app:unhide()
    end
    hiddenApplications = {}
  else
    for _, window in ipairs(visible) do
      app = window:application()
      if not app:isHidden() then
        table.insert(hiddenApplications, app)
        app:hide()
      end
    end

    for _, window in ipairs(hs.application("Finder"):allWindows()) do
      window:close()
    end
  end
end)

-- idea for a keybinding to switch to the archive:
-- first, hide all apps
-- then focus the archive
-- and resize well


-- hs.hotkey.bind({ "ctrl", "cmd" }, "I", function()
--   local iterm = hs.application.find("iTerm")
--   if not iterm then
--     hs.application.launchOrFocus("iTerm")
--   else
--     local vscode = hs.application.find("Visual Studio Code")
--     if not vscode then
--       hs.application.launchOrFocus("Visual Studio Code")
--     else
--       vscode:activate()
--     end
--   end
-- end)
hs.hotkey.bind({ "ctrl", "cmd" }, "H", function()
  hs.executeTerminal("/usr/local/bin/exec-in ~/.hammerspoon /Users/charles/bin/nvim init.lua")
end)

hs.alert.defaultStyle.atScreenEdge = 1


--- Bike tire hotkey only when bike app is focused

local bikeHotkey = hs.hotkey.new({ "cmd", "shift" }, "2", function()
  hs.execute("osascript $HOME/code/bike-tire/main.applescript")
end)

hs.window.filter.new("Bike")
    :subscribe(hs.window.filter.windowFocused, function() bikeHotkey:enable() end)
    :subscribe(hs.window.filter.windowUnfocused, function() bikeHotkey:disable() end)
-- Reload automatically
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
hs.alert.show("Config loaded")

require "projects"
require "nicewindowsize"
