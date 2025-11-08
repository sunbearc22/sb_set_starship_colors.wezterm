# sb_set_starship_colors.wezterm

![set_starship_colors](images/set_starship_colors)

The purpose of this plugin is to illustrate how the colors of features covered by Starship can be customize in WezTerm.

DO NOT DIRECTLY APPLY THIS PLUGIN WITHOUT FIRST CUSTOMISING THE CONTENTS OF `plugin/set_starship_colors.lua` as it can corrupt your `~/.config/starship.toml` file.

NOTE:
a. This plugin will only work after:
   1. the [sb_show_system_color.wezterm](https://github.com/sunbearc22/sb_show_system_color.wezterm.git) plugin is used.
   2. `plugin/set_starship_colors.lua` is amended to suite the contents of your `~/.config/starship.toml` file.
b. It does not have a `apply_to_config()` method as it is unrelated to WezTerm's `Config` struct.

## Usage

```lua
local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Add these lines to use the plugin:
local repo = "https://github.com/sunbearc22/sb_set_starship_colors.wezterm.git"
wezterm.plugin.require(repo)

return config
```

## Update

Press <kbd>CTRL</kbd><kbd>SHIFT</kbd><kbd>L</kbd> and run `wezterm.plugin.update_all()`.

## Removal

1. Press <kbd>CTRL</kbd><kbd>SHIFT</kbd><kbd>L</kbd> and run `wezterm.plugin.list()`.
2. Delete the `"plugin_dir"` directory of this plugin.

