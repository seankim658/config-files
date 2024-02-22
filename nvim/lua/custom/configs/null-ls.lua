local null_ls = require('null-ls')

-- Configure mypy to use the virtual environments's mypy executable
local mypy_command = vim.fn.getenv("VIRTUAL_ENV") .. "/bin/mypy"
local mypy = null_ls.builtins.diagnostics.mypy.with({
  command = mypy_command,
  diagnostic_config = {
    virtual_text = false,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true
  }
})

local opts = {
  sources = {
    mypy,
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.formatting.black
  }
}
return opts
