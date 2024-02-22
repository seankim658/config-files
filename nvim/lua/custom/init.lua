vim.opt.relativenumber = true
vim.api.nvim_set_keymap("n", "<leader>xx", "<cmd>Trouble<cr>", {silent = true, noremap = true})
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false
    }
)
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, {noremap = true, silent = true})
