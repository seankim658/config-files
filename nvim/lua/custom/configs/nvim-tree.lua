local options = require("plugins.configs.nvimtree")

options.git.enable = true
options.filters.git_ignored = false
options.renderer.highlight_git = true
options.renderer.icons.show.git = true
options.renderer.icons.git_placement = "after"
options.renderer.icons.padding = "   "
options.renderer.icons.glyphs.git = {
  unstaged = "M",
  staged = "A",
  unmerged = "U",
  renamed = "R",
  untracked = "U",
  deleted = "D",
  ignored = "!"
}

return options
