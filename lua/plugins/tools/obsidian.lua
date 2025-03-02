local M = { "epwalsh/obsidian.nvim" }

M.version = "*"

M.lazy = true

M.ft = "markdown"

M.opts = {
  workspaces = {
    {
      name = "meus-notae",
      path = "~/notes/meus-notae",
    },
  },
  picker = {
    name = "fzf-lua",
  }
}

M.keys = {
  {
    "gf",
    function()
      if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
      else
        return "gf"
      end
    end,
    desc = "Obsidian follow link"
  }
}


return M
