local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}
wezterm.on('update-right-status', function(window, pane)
  window:set_right_status(window:active_workspace())
end)

config.keys = {
  -- Prompt for a name to use for a new workspace and switch to it.
  {
    key = 'W',
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
    -- color_scheme = 'Everforest Dark Hard (Gogh)', 
    -- color_scheme = 'Operator Mono Dark',
    -- config.color_scheme = 'Bamboo Light'
    -- config.color_scheme = 'OneHalfDark'
    -- config.color_scheme = 'Bluloco Light (Gogh)'
    -- config.color_scheme = 'Bluloco Zsh Light (Gogh)'
    -- config.color_scheme = 'BlulocoLight'
-- config.color_scheme = 'Builtin Light'
-- config.color_scheme = 'Builtin Tango Light'
-- config.color_scheme = 'Builtin Solarized Light'
config.color_scheme = 'Catppuccin Latte (Gogh)'
    config.font = wezterm.font 'JetBrains Mono'
    config.window_decorations = "NONE"
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
