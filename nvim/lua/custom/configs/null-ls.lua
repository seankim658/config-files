local null_ls = require('null-ls')

local diagnostic_config = {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true
}

-- Configure mypy to use the virtual environments's mypy executable and 
-- hide inline diagnostic text. 
local mypy_command = vim.fn.getenv("VIRTUAL_ENV") .. "/bin/mypy"
local mypy = null_ls.builtins.diagnostics.mypy.with({
  command = mypy_command,
  diagnostic_config = diagnostic_config
})

-- Apply same diagnostic config to ruff
local ruff = null_ls.builtins.diagnostics.ruff.with({
  diagnostic_config = diagnostic_config
})

local opts = {
  sources = {
    mypy,
    ruff,
    null_ls.builtins.formatting.black
  }
}
return opts
