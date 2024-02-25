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

--- Python Config ---

-- Configure mypy to use the virtual environments's mypy executable and
-- hide inline diagnostic text.
local function get_mypy_path(workspace)
  -- Use activated virtual env if possible
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'mypy')
  end

  -- Find and use virtual env in workspace directory
  for _, pattern in ipairs({ "*", ",*" }) do
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
  diagnostic_config = diagnostic_config,
  filetypes = { "python" }
})

-- Apply same diagnostic config to ruff
local ruff = null_ls.builtins.diagnostics.ruff.with({
  diagnostic_config = diagnostic_config,
  filetypes = { "python" }
})

local black = null_ls.builtins.formatting.black.with({
  filetypes = { "python" }
})

-- Javascript/Typescript Config --

local eslint_d_diagnostics = null_ls.builtins.diagnostics.eslint_d.with({
  diagnostic_config = diagnostic_config,
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
})

local eslint_d_code_actions = null_ls.builtins.code_actions.eslint_d.with({
  filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
})

-- Prettier --

local prettier = null_ls.builtins.formatting.prettier.with({
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "css",
    "scss",
    "html",
    "json",
    "yaml",
    "markdown",
    "vue"
  }
})

--- Opts ---

local opts = {
  sources = {
    mypy,
    ruff,
    black,
    eslint_d_diagnostics,
    eslint_d_code_actions,
    prettier
  }
}

null_ls.setup(opts)
