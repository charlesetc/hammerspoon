hs.window.animationDuration = 0.1

hs.hotkey.bind({"cmd", "alt"}, "W", function() 
    hs.notify.new({title="Hammerspoon", informativeText="Hello World"}):send()
end)

-- Reload automatically
hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
hs.alert.show("Config loaded")

require 'hide_windows'
