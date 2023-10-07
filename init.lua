function hs.executeTerminal(s)
  iterm = hs.application("iTerm")
  iterm:activate()
  iterm:selectMenuItem({ "Shell", "New Tab" })
  hs.eventtap.keyStrokes("exec " .. s)
  hs.eventtap.keyStroke({}, "return")
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


hs.hotkey.bind({ "ctrl", "cmd" }, "H", function()
  hs.executeTerminal("/usr/local/bin/exec-in ~/.hammerspoon /Users/charles/bin/nvim init.lua")
end)

hs.alert.defaultStyle.atScreenEdge = 1


-- Reload automatically
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
hs.alert.show("Config loaded")

require "projects"
require "nicewindowsize"
