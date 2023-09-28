hs.hotkey.bind({"cmd", "ctrl"}, "down", function()
  local screenFrame = hs.screen.mainScreen():frame()
  local win = hs.window.frontmostWindow()
  local app = win:application()

  local ratio_x = 0.85
  local ratio_y = 0.9

  if app:name() == "iTerm2" then
    ratio_x = 0.6
    ratio_y = 0.7
  elseif app:name() == "The Archive" then
    ratio_x = 0.6
    ratio_y = 0.85
  end
  
  local newFrame = {
      x = screenFrame.x + (screenFrame.w * (1 - ratio_x) / 2),
      y = screenFrame.y + (screenFrame.h * (1 - ratio_y) / 2),
      w = screenFrame.w * ratio_x,
      h = screenFrame.h * ratio_y,
  }

  win:setFrame(newFrame)
end)             

