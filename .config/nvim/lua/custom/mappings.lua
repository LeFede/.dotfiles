local M = {}
M.general = {
  i = {
    ["jk"] = { "<ESC>", "Exit insert mode" },
    ["<C-b>"] = { "<ESC>^i", "beginning of line" },
    -- go to  beginning and end
    ["<C-e>"] = { "<End>", "end of line" },

    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", "move left" },
    ["<C-l>"] = { "<Right>", "move right" },
    ["<C-j>"] = { "<Down>", "move down" },
    ["<C-k>"] = { "<Up>", "move up" },
  },

  n = {
    ["<C-b>"] = { "<cmd> %bd|e#|bd# <CR>", "Close buffers but this one"},
    ["<C-a>"] = { "<cmd> normal! gg0VG <CR>", "Select All" },
    ["<S-Up>"] = { "<cmd>m--<CR>" , "Move up"},
    ["<S-Down>"] = { "<cmd>m+<CR>" , "Move down"},
    ["<Esc>"] = { ":noh <CR>", "clear highlights" },
    -- switch between windows
    ["<C-h>"] = { "<C-w>h", "window left" },
    ["<C-l>"] = { "<C-w>l", "window right" },
    ["<C-j>"] = { "<C-w>j", "window down" },
    ["<C-k>"] = { "<C-w>k", "window up" },

    -- save
    ["<C-s>"] = { "<cmd> w <CR>", "save file" },
  },

}

-- M.dap = {
--   plugin = true,
--   n = {
--     ["<leader>db"] = {
--       "<cmd> DapToggleBreakpoint <CR>",
--       "Add breakpoint at line",
--     },
--     ["<leader>dr"] = {
--       "<cmd> DapContinue <CR>",
--       "Start or continue the debugger",
--     }
--   }
-- }

return M
