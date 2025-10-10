local flr = math.floor

hs.hotkey.bind({ "cmd", "ctrl" }, "down", function()
  print("down")
  local win = hs.window.frontmostWindow()
  local app = hs.application.frontmostApplication()
  local screen = win:screen():frame()

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

  if app:name() == "Bike" then
    w = 650
    h = 750
  end
  local f = win:frame()

  if flr(f.w) == flr(w  * 0.8) and flr(f.h) == flr(h * 0.8) then
    w = w * 0.6
    h = h * 0.6
  elseif flr(f.w) == flr(w) and flr(f.h) == flr(h) then
    w = w * 0.8
    h = h * 0.8
  end

  local x = screen.x + (screen.w - w) / 2
  local y = screen.y + (screen.h - h) / 2

  win:setFrameInScreenBounds { w = w, h = h, x = x, y = y }
end)


hs.hotkey.bind({ "cmd", "ctrl" }, "up", function()
  local win = hs.window.frontmostWindow()
  local screen = win:screen():frame()

  local w = screen.w - 100
  local h = screen.h - 100

  local f = win:frame()

  if flr(f.w) == flr(w) and flr(f.h) == flr(h) then
    w = screen.w
    h = screen.h
  end

  local x = screen.x + (screen.w - w) / 2
  local y = screen.y + (screen.h - h) / 2

  win:setFrame { w = w, h = h, x = x, y = y }
end)


local margin = 50

hs.hotkey.bind({ "cmd", "ctrl" }, "left", function()
  local win = hs.window.frontmostWindow()
  local screen = win:screen():frame()

  local w = screen.w * 0.5
  local h = screen.h
  local x = 0
  local y = 0

  local f = win:frame()
  if flr(f.w) == flr(w) and flr(f.h) == flr(h) and
    flr(f.x) == flr(x) and flr(f.y) == flr(y) then
    w = screen.w * 0.5 - margin * 1.5
    h = screen.h - margin * 2
    x = margin
    y = margin
  end

  win:setFrame { w = w, h = h, x = screen.x + x, y = screen.y + y }
end)

hs.hotkey.bind({ "cmd", "ctrl" }, "right", function()
  local win = hs.window.frontmostWindow()
  local screen = win:screen():frame()

  local w = screen.w * 0.5
  local h = screen.h
  local x = screen.w * 0.5
  local y = 0

  local f = win:frame()
  if flr(f.w) == flr(w) and flr(f.h) == flr(h) and
      flr(f.x) == flr(x) and flr(f.y) == flr(y) then
    w = screen.w * 0.5 - margin * 1.5
    h = screen.h - margin * 2
    x = screen.w * 0.5 + margin * 0.5
    y = margin
  end

  win:setFrame { w = w, h = h, x = screen.x + x, y = screen.y + y }
end)