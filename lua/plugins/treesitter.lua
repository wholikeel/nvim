return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup {
          		ensure_installed = {
				"query",
				"c",
				"lua",
				"vim",
				"vimdoc",
				"cpp",
				"cmake",
                "html",
                "xml",
                "markdown"
			},
          		sync_install = false,
          		highlight = { enable = true },
          		indent = { enable = true },
        	}
	end,
}
