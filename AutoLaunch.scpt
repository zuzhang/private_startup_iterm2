set switch_path to "~/Documents/projects/docker-switch"
set big_ui_path to "~/Documents/projects/big_ui"
set search_path to "~/Documents/projects/search"
tell application "iTerm2"
  -- switch
  tell first session of current tab of current window
    write text "cd " & switch_path
    write text "./run.sh"
  end tell

  -- uif
  tell current window
    create tab with default profile
  end tell

  tell first session of current tab of current window
    write text "cd " & big_ui_path & "/ui"
    write text "rails s"
    split vertically with default profile 
  end tell

  tell second session of current tab of current window
    write text "cd " & big_ui_path & "/ui"
    write text "yarn start"
  end tell

  -- search
  tell current window
    create tab with default profile
  end tell

  tell first session of current tab of current window
    write text "cd " & search_path & "/search-install"
    write text "./bin/start.sh"
    write text "cd " & search_path & "/mysql-tracer/target/mysql-tracer"
    write text "./bin/stop.sh"
  end tell
end tell
