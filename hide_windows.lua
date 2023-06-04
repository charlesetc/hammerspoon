function applicationWatcher(appName, eventType, appObject)
  if (eventType == hs.application.watcher.activated) then
    windows = hs.window.visibleWindows()
    if appName == "The Archive" then
      for _, window in ipairs(windows) do
        if (appName ~= window:application():name() and window:application():name() ~= "Finder") then
          -- hs.alert.show(window:application():name())
          window:application():hide()
        end
      end
    end
  end
end
appWatcher = hs.application.watcher.new(applicationWatcher)
appWatcher:start()
