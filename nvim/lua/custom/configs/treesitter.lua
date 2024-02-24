local options = require("plugins.configs.treesitter")

options.indent = {
  enable = true,
  disable = {
    "python"
  }
}

return options
