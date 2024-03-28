---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'catppuccin',
  hl_override = {
    CursorLine = {
      bg = "one_bg"
    }
  }
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")


-- M.colorcolumn = 20

return M
