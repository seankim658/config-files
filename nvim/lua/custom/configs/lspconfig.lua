local configs = require("plugins.configs.lspconfig")
local util = require("lspconfig/util")

local path = util.path
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")

--- Python setup ---

local function get_python_path(workspace)
  -- Use activated virtualenv
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv in workspace directory
  for _, pattern in pairs({"*", ".*"}) do
    local match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
    if match ~= '' then
      return path.join(path.dirname(match), "bin", "python")
    end
  end

  -- Fallback to system Python.
  return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
  before_init = function(_, config)
    local env = get_python_path(config.root_dir)
    print(env)
    config.settings.python.pythonPath = env
  end
})

--- Typescript/JS setup ---

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"typescript", "javascript"},
  init_options = {
    preferences = {
      disableSuggestions = true,
    }
  }
})
