local jdtls = require("jdtls")

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

local config = {
  cmd = {
    "jdtls",
    "-data", workspace_dir,
  },
  root_dir = vim.fs.root(0, {".project", ".classpath", 'gradlew', '.git', 'mvnw'}),
}

require("jdtls").start_or_attach(config)
