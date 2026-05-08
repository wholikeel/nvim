

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (_)
        vim.keymap.set('n', '<localleader>s', '<cmd>ClangdSwitchSourceHeader<cr>')
    end
})
