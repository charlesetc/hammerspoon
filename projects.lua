 math.randomseed(os.time())

local chooser = hs.chooser.new(function(choice)
  if choice then
    local filePath = choice["text"]
    -- hs.executeTerminal("/usr/local/bin/exec-in ~/code/" .. filePath .. " /Users/charles/bin/nvim")
    hs.executeTerminal("/usr/local/bin/exec-in ~/code/" .. filePath .. " /bin/zsh")
  end
end)

local function populateChooser()
  local lsOutput = hs.execute("ls ~/code")
  local lines = {}
  for line in lsOutput:gmatch("[^\r\n]+") do
    table.insert(lines, {
      text = line,
      subText = "File",
    })
  end
  chooser:choices(lines)
end


-- Removed this because I'm using this keybinding in vs code 
-- and wasn't using it here

-- hs.hotkey.bind({"cmd", "ctrl"}, "return", function()
--   chooser:query("")
--   populateChooser()
--   chooser:show()
-- end)
