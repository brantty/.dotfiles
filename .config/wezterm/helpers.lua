local wezterm = require 'wezterm'

local module = {}

local function private_helper()
  wezterm.log_error 'hello!'
end

function module.apply_to_config(config)
  private_helper()

  config.color_scheme = 'OneDark'
end

return module
