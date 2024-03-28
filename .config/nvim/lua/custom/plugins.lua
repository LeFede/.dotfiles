local plugins = {
  -- {
  --   "michaelrommel/nvim-silicon",
  --   lazy = true,
  --   cmd = "Silicon",
  --   config = function()
  --     require("silicon").setup({
  --       font = "JetBrainsMono Nerd Font=30"
  --     })
  --   end
  -- },
  -- {
  --   "mfussenegger/nvim-dap",
  --   config = function(_, _)
  --     require("core.utils").load_mappings("dap")
  --   end,
  -- },
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   event = "VeryLazy",
  --   dependecies = "mfussenegger/nvim-dap",
  --   config = function()
  --     local dap = require("dap")
  --     local dapui = require("dapui")
  --     dapui.setup()
  --     dap.listeners.after.event_initialized["dapui_config"] = function()
  --       dapui.open()
  --     end
  --     dap.listeners.before.event_terminated["dapui_config"] = function()
  --       dapui.close()
  --     end
  --     dap.listeners.before.event_exited["dapui_config"] = function()
  --       dapui.close()
  --     end
  --   end,
  -- },
  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   event = "VeryLazy",
  --   dependecies = {
  --     "williamboman/mason.nvim",
  --     "mfussenegger/nvim-dap",
  --   },
  --   opts = {
  --     handlers = {},
  --   },
  -- },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "tailwindcss-language-server",
        "typescript-language-server",
        "emmet-language-server",
        "cssmodules-language-server",
        "clangd",
        "lua-language-server",
        "css-lsp",
        "eslint-lsp",
        "prettierd",
        "rust-analyzer",
        "zls",
        -- "clang-format",
        -- "codelldb",
      }
    }
  },
  {
    "okuuva/auto-save.nvim",
    -- cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = require("custom.configs.auto-save"),
  },

  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require "plugins.configs.lspconfig"
  --     require "custom.configs.lspconfig"
  --   end
  -- },
  -- {
  --   "nvimtools/none-ls.nvim",
  --   event = "VeryLazy",
  --   opts = function()
  --     return require "custom.configs.null-ls"
  --   end,
  -- },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function ()
      opts = require "plugins.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "tsx",
        "c",
        "css",
        "rust",
      }
      return opts
    end
  },

}

return plugins
