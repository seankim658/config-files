local plugins = {
  {
    "mechatroner/rainbow_csv",
    ft = {"tsv", "csv"}
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "mypy",
        "ruff",
        "black"
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
    "nvim-tree/nvim-tree.lua",
    config = function ()
      require "plugins.configs.nvimtree"
      require "custom.configs.nvim-tree"
    end
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python"},
    opts = function()
      return require "custom.configs.null-ls"
    end
  },
  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = {"nvim-tree/nvim-web-devicons"},
    opts = {}
  }
}

return plugins
