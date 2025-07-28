vim.o.undofile       = true
-- vim.o.clipboard       = "unnamedplus"
-- vim.o.laststatus      = 1
vim.opt.expandtab    = true
vim.opt.shiftwidth   = 4
vim.opt.softtabstop  = -1
vim.o.tabstop        = 4

vim.o.number         = true
vim.o.relativenumber = true
vim.o.wrap           = true
vim.o.swapfile       = false
vim.o.signcolumn     = "yes"
vim.o.winborder      = "rounded"

vim.g.mapleader      = vim.keycode("<space>")
vim.g.maplocalleader = vim.keycode(";")


-- vim.keymap.set("n", "<localleader>o", ":Ex<CR>")

vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")

vim.keymap.set("n", "<leader>c", function()
    vim.ui.input({}, function(c)
        if c and c ~= "" then
            vim.cmd("noswapfile vnew")
            vim.bo.buftype = "nofile"
            vim.bo.bufhidden = "wipe"
            vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.systemlist(c))
        end
    end)
end
)

vim.keymap.set("n", "<localleader>f", vim.lsp.buf.format)

vim.pack.add({
    { src = "https://github.com/blazkowolf/gruber-darker.nvim" },
    { src = "https://github.com/vague2k/vague.nvim" },
    { src = "https://github.com/echasnovski/mini.pick" },
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/saghen/blink.cmp" },
    { src = "https://github.com/mfussenegger/nvim-jdtls" },
    -- {src = "https://github.com/"},
})

-- require("java").setup()

-- {
--   buf = 1,
--   data = {
--     kind = "update",
--     path = "/home/michaell/.local/share/nvim/site/pack/core/opt/blink.cmp",
--     spec = {
--       name = "blink.cmp",
--       src = "https://github.com/saghen/blink.cmp"
--     }
--   },
--   event = "PackChangedPre",
--   file = "/home/michaell/.local/share/nvim/site/pack/core/opt/blink.cmp",
--   id = 14,
--   match = "/home/michaell/.local/share/nvim/site/pack/core/opt/blink.cmp"
-- }
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function (ev)
        if ev.data.kind ~= "update" and ev.data.kind ~= "install" then
            return
        end
        vim.notify("Building blink.cmp", vim.log.levels.INFO)
        local obj = vim.system({"nix", "run", ".#build-plugin"}, { cwd = ev.data.path}):wait()
        if obj.code == 0 then
            vim.notify("Building blink.cmp done", vim.log.levels.INFO)
        else
            vim.notify("Building blink.cmp failed", vim.log.levels.ERROR)
        end
    end
})

require("blink.cmp").setup({
  keymap = { preset = "default" },
  appearance = {
    nerd_font_variant= "mono"
  },
  completion = { documentation = { auto_show = false } },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" }
  },
  fuzzy = { implementation = "prefer_rust_with_warning" }
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client:supports_method("textDocument/completition") then
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
        end
    end
})
vim.cmd("set completeopt+=noselect")

-- vim.cmd("syntax off | colorscheme retrobox | highlight Normal guifg=#ffaf00 guibg=#282828")
-- vim.cmd("syntax off | colorscheme vague | highlight Normal guifg=#ffaf00 guibg=#282828")

vim.cmd.colorscheme("vague")
vim.cmd(":hi statusline guibg=NONE")

require("mini.pick").setup()

vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")


vim.lsp.enable({ "lua_ls", "basedpyright", "jdtls"})


require("java")
