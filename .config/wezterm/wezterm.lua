local wezterm = require 'wezterm'
local appearance = require 'modules.appearance'
local act = wezterm.action

local config = {}
wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)
appearance.apply_to_config(config)
config.keys = {
  -- Prompt for a name to use for a new workspace and switch to it.
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = act.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for new workspace' },
      },
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:perform_action(
            act.SwitchToWorkspace {
              name = line,
            },
            pane
          )
        end
      end),
    },
  },
}
    -- Leader is the same as my old tmux prefix
    config.leader = { key = '…', timeout_milliseconds = 1000 }
    config.keys = {
      -- splitting
      {
        mods   = "LEADER",
        key    = "-",
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }
      },
      {
        mods   = "LEADER",
        key    = "=",
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }
      }
    }
return config
