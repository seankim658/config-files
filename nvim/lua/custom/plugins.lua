local plugins = {
  {
    "mechatroner/rainbow_csv",
    ft = {"tsv", "csv"}
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      return require "plugins.configs.treesitter"
    end
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      return require "custom.configs.nvim-tree"
    end
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "mypy",
        "ruff",
        "black",
        "typescript-language-server",
        "eslint_d",
        "prettier",
        "bash-language-server"
      }
    }
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require "custom.configs.null-ls"
    end,
    ft = {
      "python",
      "javascript",
      "jsx",
      "typescript",
      "tsx",
      "html",
      "css",
      "scss",
      "markdown",
      "json",
      "vue",
      "yaml"
    }
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons"},
    opts = {}
  }
}

return plugins
