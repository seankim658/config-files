local null_ls = require('null-ls')
local util = require('lspconfig/util')

local path = util.path

local diagnostic_config = {
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true
}

-- Configure mypy to use the virtual environments's mypy executable and 
-- hide inline diagnostic text. 

local function get_mypy_path(workspace)

  -- Use activated virtual env if possible 
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'mypy')
  end

  -- Find and use virtual env in workspace directory 
  for _, pattern in ipairs({"*", ",*"}) do
    local match = vim.fn.glob(path.join(workspace, pattern, "pyenv.cfg"))
    if match ~= '' then
      return path.join(path.dirname(match), "bin", "python")
    end
  end

  -- Fallback to system mypy.
  return vim.fn.exepath("mypy") or "mypy"

end

local mypy = null_ls.builtins.diagnostics.mypy.with({
  command = get_mypy_path(vim.fn.getcwd()),
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
