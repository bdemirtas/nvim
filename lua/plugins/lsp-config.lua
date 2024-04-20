local servers = {
  "bashls",
  "cssls",
  "dockerls",
  "eslint",
  'html',
  "jsonls",
  "jinja_lsp",
  "jqls",
  "lua_ls",
  "marksman",
  "pyright",
  "taplo",
  "yamlls",
}

local settings = {
  ui = {
    border = "none",
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    },
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup(settings)
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_installation = true,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local opts = {}
      local lspconfig = require("lspconfig")

      for _, server in pairs(servers) do
        opts = {
          on_attach = require("helper.lsp.handlers").on_attach,
          capabilities = require("helper.lsp.handlers").capabilities,
          settings = require("helper.lsp.handlers").settings(server)
        }
        server = vim.split(server, "@")[1]
        lspconfig[server].setup(opts)
      end
    end
  },
}
