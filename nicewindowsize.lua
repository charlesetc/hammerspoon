hs.hotkey.bind({"cmd", "ctrl"}, "down", function()
  local screen = hs.screen.mainScreen():frame()
  local win = hs.window.frontmostWindow()
  local app = win:application()

  local w = screen.w * 0.85
  local h = screen.h * 0.9

  if app:name() == "iTerm2" then
    w = screen.w * 0.75
    h = screen.h * 0.85
  end

  if app:name() == "The Archive" then
    w = 800
    h = 700
  end

  local f = win:frame()

  if math.floor(f.w) == math.floor(w  * 0.8) and math.floor(f.h) == math.floor(h * 0.8) then
    w = w * 0.6
    h = h * 0.6
  elseif math.floor(f.w) == math.floor(w) and math.floor(f.h) == math.floor(h) then
    w = w * 0.8
    h = h * 0.8
  end

  local x = (screen.w - w) / 2
  local y = (screen.h - h) / 2

  win:setFrame { w = w, h = h, x = x, y = y }
end)


hs.hotkey.bind({"cmd", "ctrl"}, "up", function()
  local screen = hs.screen.mainScreen():frame()
  local win = hs.window.frontmostWindow()

  local w = screen.w - 100
  local h = screen.h - 100

  local f = win:frame()

  if math.floor(f.w) == math.floor(w) and math.floor(f.h) == math.floor(h) then
    w = screen.w
    h = screen.h
  end

  local x = (screen.w - w) / 2
  local y = (screen.h - h) / 2

  win:setFrame { w = w, h = h, x = x, y = y }
end)

hs.hotkey.bind({"cmd", "ctrl"}, "left", function()
  local screen = hs.screen.mainScreen():frame()
  local win = hs.window.frontmostWindow()

  local w = screen.w * 0.5 - 75
  local h = screen.h - 100

  local x = 50
  local y = 50

  win:setFrame { w = w, h = h, x = x, y = y }
end)

hs.hotkey.bind({"cmd", "ctrl"}, "right", function()
  local screen = hs.screen.mainScreen():frame()
  local win = hs.window.frontmostWindow()

  local w = screen.w * 0.5 - 75
  local h = screen.h - 100

  local x = screen.w * 0.5 + 25
  local y = 50

  win:setFrame { w = w, h = h, x = x, y = y }
end)



