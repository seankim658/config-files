vim.opt.relativenumber = true
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "<A-1>", "<C-w>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-2>", "<C-w>-", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-3>", "<C-w><", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-4>", "<C-w>>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<A-5>", "<C-w>=", { noremap = true, silent = true })
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false
  }
)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { noremap = true, silent = true })
vim.cmd [[
  hi NvimTreeGitDeletedIcon guifg=#C74E39 gui=bold
  hi NvimTreeGitDirtyIcon guifg=#CE9178 gui=bold
  hi NvimTreeGitIgnoredIcon guifg=#A9A9A9 gui=bold
  hi NvimTreeGitMergeIcon guifg=#C586C0 gui=bold
  hi NvimTreeGitNewIcon guifg=#B5CEA8 gui=bold
  hi NvimTreeGitRenamedIcon guifg=#B5CEA8 gui=bold
  hi NvimTreeGitStagedIcon guifg=#569CD6 gui=bold
  hi NvimTreeModifiedFile guifg=#6A9955 gui=bold
]]
