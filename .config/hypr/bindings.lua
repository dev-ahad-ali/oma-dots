-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
hl.unbind("SUPER + SHIFT + S") -- Disable default keybinding for maps
o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot") --- assign it for screenshot

hl.unbind("SUPER + SHIFT + B") -- Disable default secondary keybinding for browser
hl.bind("SUPER + SHIFT + B", function() -- assign it for firefox
  hl.exec_cmd("firefox")
end, { description = "Launch Firefox" })

-- Logitech MX Keys examples:
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- strata-installer: file-manager start
hl.unbind("SUPER + SHIFT + F")
hl.unbind("SUPER + ALT + SHIFT + F")
o.bind("SUPER + SHIFT + F", "File manager", { launch = "/home/dev-ahad-ali/.local/bin/strata" })
o.bind("SUPER + ALT + SHIFT + F", "File manager (cwd)",
  "uwsm-app -- /home/dev-ahad-ali/.local/bin/strata \"$(omarchy-cmd-terminal-cwd)\"")
-- strata-installer: file-manager end

-- keybinding to launch zed code editor
hl.bind("SUPER + Z", function()
  hl.exec_cmd("zeditor")
end, { description = "Launch Zed editor" })

-- custom keybinding for setting different maximizing methods in different layouts
hl.unbind("SUPER + ALT + F")

hl.bind("SUPER + ALT + F", function()
  local workspace = hl.get_active_workspace()

  if workspace.tiled_layout == "scrolling" then
    local window = hl.get_active_window()

    if window.size.x >= 1800 then
      hl.dispatch(hl.dsp.layout("colresize 0.5"))
    else
      hl.dispatch(hl.dsp.layout("colresize 1.0"))
    end
  else
    hl.dispatch(hl.dsp.window.fullscreen({ mode = "maximized" }))
  end
end, { description = "Toggle full-width column" })


-- super + f9 to toggle voxtype
hl.bind("SUPER + F9", function()
  hl.exec_cmd([[bash -c '
    if systemctl --user is-active --quiet voxtype; then
      systemctl --user stop voxtype &&
        notify-send "Voxtype" "Dictation stopped"
    else
      systemctl --user start voxtype &&
        notify-send "Voxtype" "Dictation started"
    fi
  ']])
end, { description = "Toggle Voxtype" })


-- media play pause
hl.bind("SUPER + CTRL + M", function()
  hl.exec_cmd("omarchy-shell media playPause")
end, { description = "Toggle media playback" })

-- microphone mute toggle
hl.bind("SUPER + ALT + M", function()
  hl.exec_cmd([[bash -lc "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle; if wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q MUTED; then omarchy-shell osd show '{\"icon\":\"microphone-muted\",\"message\":\"Microphone muted\"}'; else omarchy-shell osd show '{\"icon\":\"microphone\",\"message\":\"Microphone on\"}'; fi"]])
end, { description = "Toggle microphone mute" })
