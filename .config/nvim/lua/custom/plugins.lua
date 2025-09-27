local plugins = {
  {
    "hrsh7th/cmp-nvim-lsp",
    commit = "39e2eda76828d88b773cc27a3f61d2ad782c922d",
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      local devicons = require("nvim-web-devicons")
      devicons.setup {
        override_by_extension = {
          ["astro"] = {
            icon = "󰑣",
            color = "#FF5D01",
            cterm_color = "202",
            name = "Astro"
          }
        }
      }
      return {}
    end,
  },
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
        "clang-format",
        "codelldb",
      }
    }
  },
  {
    "okuuva/auto-save.nvim",
    -- cmd = "ASToggle",
    event = { "InsertLeave", "TextChanged" },
    opts = require("custom.configs.auto-save"),
  },

  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "astro",
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
        "astro",
      }
      return opts
    end
  },

  -- RUST 
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function ()
      vim.g.rustfmt_autosave = 1
    end
  },

  -- Tmux Navigator
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

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
}

vim.g.astro_typescript = 'enable'
-- vim.g.astro_stylus = 'enable'

return plugins
