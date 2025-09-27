local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
-- Fix para el error de cmp-nvim-lsp
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.astro.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
  init_options = {
    typescript = {
      tsdk = "/usr/lib/node_modules/typescript/lib"
    },
    environment = {
      NODE_PATH = "/usr/lib/node_modules"
    }
  },
  settings = {
    prettier = {
      configPath = vim.fn.expand("~/.prettierrc.json"),
      prettierPath = "/usr/lib/node_modules/prettier",
      pluginPath = {
        "/usr/lib/node_modules/prettier-plugin-astro"
      }
    }
  }
})

lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = capabilities
}

-- local on_attach = require("plugins.configs.lspconfig").on_attach
-- local capabilities = require("plugins.configs.lspconfig").capabilities

local servers = {
  "html",
  "cssls",
  "ts_ls",
  "cssmodules_ls",
  "tailwindcss",
  "eslint",
  "zls",
}
-- local util = require "lspconfig/util"

lspconfig.rust_analyzer.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"rust"},
  root_dir = util.root_pattern("Cargo.toml"),
  settings = {
    ['rust_analyzer'] = {
      cargo = {
        loadOutDirsFromCheck = true,
      },
      procMacro = {
        enable = true,
      },
      checkOnSave = {
        command = "clippy",
      },
    },
  },
})

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Java LSP (jdtls) configuration
lspconfig.jdtls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "-Xmx2G",
    "-jar",
    vim.fn.glob(vim.fn.expand("~/.local/share/nvim/lsp/jdtls/plugins/org.eclipse.equinox.launcher_*.jar")),
    "-configuration",
    vim.fn.expand("~/.local/share/nvim/lsp/jdtls/config_linux"),
    "-data",
    vim.fn.expand("~/.cache/jdtls-workspace"),
  },
  root_dir = util.root_pattern(".git", "mvnw", "gradlew", "pom.xml", "build.gradle"),
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      format = {
        enabled = true,
      },
    },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
      importOrder = {
        "java",
        "javax",
        "com",
        "org",
      },
    },
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      useBlocks = true,
    },
  },
  flags = {
    allow_incremental_sync = true,
  },
  init_options = {
    bundles = {},
  },
})
