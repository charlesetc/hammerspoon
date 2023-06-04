hs.window.animationDuration = 0.1

hs.hotkey.bind({"ctrl", "cmd"}, "r", function() 
  hs.reload()
end)


hs.hotkey.bind({"ctrl", "cmd"}, "T", function() 
  iterm = hs.application.find("iTerm")
  iterm:activate()
  iterm:selectMenuItem({"Shell", "New Window"})
end)

-- Reload automatically
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
hs.alert.show("Config loaded")

require 'hide_windows'
hhtwm = require('hhtwm')
hhtwm.margin = 20
margin = 10
hhtwm.screenMargin = { top = margin, bottom = margin, left = margin, right = margin }
-- hhtwm.defaultLayouts = [ "floating" ]

hhtwm.filters = {
  { app = 'Finder', tile = false },
  { app = 'Hammerspoon', title = 'Hammerspoon Console', tile = false },
  { app = 'The Archive', tile = false },
}
hhtwm.start()
hhtwm.setLayout("main-left")
