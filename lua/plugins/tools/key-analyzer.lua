local M = { "meznaric/key-analyzer.nvim" }


local cmd_name = "KeyAnalyzer"

M.opts = {
  command_name = cmd_name,   -- or nil to disable the command

  highlights = {
    bracket_used = "KeyAnalyzerBracketUsed",
    letter_used = "KeyAnalyzerLetterUsed",
    bracket_unused = "KeyAnalyzerBracketUnused",
    letter_unused = "KeyAnalyzerLetterUnused",
    promo_highlight = "KeyAnalyzerPromo",

    define_default_highlights = true,
  },
}

M.cmd = {
  cmd_name
}

return M
