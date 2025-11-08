local wezterm = require("wezterm")

-- Find Plugin path
local function find_plugin_package_path(myproject)
  local separator = package.config:sub(1, 1) == "\\" and "\\" or "/"
  for i, v in ipairs(wezterm.plugin.list()) do
    -- wezterm.log_info("[STARSHIP] " .. i .. " " .. v.url)
    if v.url == myproject then
      -- wezterm.log_info("[STARSHIP] v.url == myproject")
      return v.plugin_dir .. separator .. 'plugin' .. separator .. '?.lua'
    end
  end
  wezterm.log_error("[STARSHIP] v.url ~= myproject")
  return nil
end

-- Find plugin path
local repo = "https://github.com/sunbearc22/sb_set_starship_colors.wezterm"
local ppath = find_plugin_package_path(repo)
-- wezterm.log_info("[STARSHIP] ppath = " .. ppath)

-- Exit if plugin is no found
if not ppath then return end

-- Update package.path (This ensures files mentioned in require() can be located)
package.path = package.path .. ";" .. ppath
-- wezterm.log_info("[STARSHIP] package.path = " .. package.path)

-- Check whether file exist
local function file_exists(filename)
  local file = io.open(filename, "r")
  if file then
    file:close()
    return true
  else
    return false
  end
end

local sfile = wezterm.home_dir .. "/.config/starship.toml"
if file_exists(sfile) then
  require("set_starship_colors")
end
