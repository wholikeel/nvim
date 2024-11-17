local ls = require "luasnip"

-- keybinds

vim.keymap.set({ "i", "s" }, "<A-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jumpable()
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<A-n>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end)

-- luasnip

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require "luasnip.extras"
local rep = extras.rep
local fmt = require "luasnip.extras.fmt".fmt
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node

-- snippets

-- ls.add_snippets("lua", {
--     s("hello", {
--         t("print(\"hello "),
--         i(1),
--         t(" world\")")
--     })
-- })


ls.add_snippets("lua", {
    s("sni", fmt(
        [[
        ls.add_snippets("{}", {{
            {}
        }})
        ]], {
            i(1), i(0)
        }
    ))
})

-- TODO: impl. https://am121.seas.harvard.edu/site/wp-content/uploads/2014/08/latex_snippets.pdf
-- ls.add_snippets("tex", {
--     s({ trig = ";a" },
--         {
--             t("\\alpha"),
--         })
-- })


-- Non-formatted version
-- ls.add_snippets("tex", {
--     s("beg", {
--         t("\\begin{"), i(1), t("}"),
--         t({ "", "\t" }, i(0)),
--         t({ "", "\\end{"}), rep(1), t("}")
--     })
-- })

-- Formatted version
-- ls.add_snippets("tex", {
--     s("beg", fmt(
--         [[
--         \begin{{{}}}
--             {}
--         \end{{{}}}
--         ]], {
--             i(1), i(0), rep(1)
--         }
--     ))
-- })


-- local fn = function ()
--     return "test"
-- end
--
-- ls.add_snippets("lua", {
--     s("example", {
--         f(fn)
--     })
-- })
