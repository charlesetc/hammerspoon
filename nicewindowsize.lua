hs.hotkey.bind({"cmd", "ctrl"}, "down", function()
  local screen = hs.screen.mainScreen():frame()
  local win = hs.window.frontmostWindow()
  local app = win:application()

  local w = screen.w * 0.85
  local h = screen.h * 0.9

  if app:name() == "iTerm2" then
    w = screen.w * 0.6
    h = screen.h * 0.7
  end

  if app:name() == "The Archive" then
    w = 800
    h = 700
  end
  -- hs.alert("Window resized to " .. w .. "x" .. h .. " and screen is " .. screen.w .. "x" .. screen.h .. " and position is " .. x .. "x" .. y)
  -- hs.alert(screen.w .. "x" .. screen.h .. " " .. screen.x .. "x" .. screen.y)

  local f = win:frame()
  if math.floor(f.w) == math.floor(w) and math.floor(f.h) == math.floor(h) then
    hs.alert("hi there")
    w = w * 0.8
    h = h * 0.8
  end

  local x = (screen.w - w) / 2
  local y = (screen.h - h) / 2

  win:setFrame { w = w, h = h, x = x, y = y }
end)             

