---@type ChadrcConfig
local M = {}

M.ui = {
  theme = 'catppuccin',
  hl_override = {
    ColorColumn = {
      -- bg = "one_b3", -- Cambia este valor al color que quieras
      bg = "#550000", -- Cambia este valor al color que quieras
    },
    CursorLine = {
      -- bg = "one_bg"
      bg = "one_bg3", -- Cambia este valor al color que quieras
    },

    -- Cambiar el color de la columna del cursor
    CursorColumn = {
      bg = "one_bg3", -- Cambia este valor al color que quieras
    },

    -- Cambiar el color del cursor
    Cursor = {
      bg = "#0000FF",
      fg = "#FF00FF",
    },
  }
}
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")


-- M.colorcolumn = 20

return M
