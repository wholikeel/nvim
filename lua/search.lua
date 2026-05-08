

vim.cmd("packadd cfilter")

local fuzzy_filter_qf = function (...)
    local qflist = vim.fn.getqflist()
    local query = table.concat({ ... }, " ")
    local result = vim.fn.matchfuzzy(qflist, query, {key =  "text"})
    vim.fn.setqflist(result)
end

local fuzzy_filter_grep = function (query, path)
  if path == nil then path = "." end
  vim.fn.execute("grep! '" .. query .. "' " .. path)
  local sort = vim.fn.substitute(query, "\\.\\*", "", "g")
  sort = vim.fn.substitute(sort, "\\\\\\(.\\)", "\\1", "g")
  fuzzy_filter_qf(sort)
  vim.cmd("cfirst")
  vim.cmd("copen")
end

local fzf_grep = function (query, path)
    if path == nil then path = "." end
    local prevgrepprg = vim.o.grepprg
    vim.o.grepprg =  "rg --vimgrep --hidden -g '!.git/*' . "
      .. path .. " \\| fzf --filter='$*' --delimiter : --nth 4.."
    vim.fn.execute("grep " .. query)
    vim.o.grepprg = prevgrepprg
end

local fzf_find = function (cmdarg, cmdcomplete)
    return vim.fn.systemlist("fd --hidden . \\| fzf --filter='"
      .. cmdarg .. "'")
end

local fd_set_qf = function (...)
    local results = vim.fn.systemlist("fd -t f --hidden "
      .. table.concat({ ... }, " "))

    local items = {}
    for k, v in pairs(results) do
        table.insert(items, {
            filename = v,
            lnum = 1,
            text = v
        })
    end
    vim.fn.setqflist(items)
end


vim.api.nvim_create_user_command("Cfuzzy", function (opts)
        fuzzy_filter_qf(unpack(opts.fargs))
    end, {
    nargs = "+",
    complete = "file"
})
vim.api.nvim_create_user_command("Findqf", function (opts)
        fd_set_qf(unpack(opts.fargs))
    end, {
    nargs = "+",
    complete = "file"
})
vim.api.nvim_create_user_command("Zgrep", function (opts)
        fuzzy_filter_grep(unpack(opts.fargs))
    end, {
    nargs = "+",
    complete = "file"
})
vim.api.nvim_create_user_command("FzfGrep", function (opts)
        fuzzy_filter_grep(unpack(opts.fargs))
    end, {
    nargs = "+",
    complete = "file"
})

