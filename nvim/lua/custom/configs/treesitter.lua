local treesitter = require("nvim-treesitter.configs")
local og_treesitter = require("plugins.configs.treesitter")

og_treesitter.indent = {
  enable = true,
  disable = {
    "python"
  }
}

treesitter.setup(og_treesitter)
