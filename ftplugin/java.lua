
-- local cfg = vim.lsp.config["jdtls"]
--
-- if not vim.fn.filereadable(cfg["cmd"][1]) then
--   return
-- end

string.has_prefix = function (s, p)
  return string.sub(s, 1, #p) == p
end

string.without_prefix = function (s, p)
  if s:has_prefix(p) then
    return s:sub(#p + 1)
  end
  return s
end

local left = function (b, l, r)
  return b and l or r
end

local function split_lines(str)
  local lines = {}
  for line in str:gmatch("([^\n]+)") do
    table.insert(lines, line)
  end
  return lines
end

-- https://github.com/mfussenegger/nvim-jdtls?tab=readme-ov-file#java-xy-language-features-are-not-available
local get_jdks = function()
  local paths = split_lines(vim.system({ 'which', '-a', 'java' }, { text = true }):wait()["stdout"])
  local runtimes = {}
  -- vim.notify(#paths, vim.log.levels.ERROR)
  for _, p in ipairs(paths) do
    local name = vim.fn.fnamemodify(p, ":h:h:t")
    table.insert(runtimes, { name = name, path = p })
    -- vim.notify("name = " .. name .. ", path = " .. vim.fn.fnamemodify(p, ":h:h"), vim.log.levels.INFO)
  end
  -- return runtimes
  return {}
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

-- local jdks = get_jdks()

local jarname = "org.eclipse.equinox.launcher_1.7.0.v20250331-1702.jar"
local jdtls = vim.fn.fnamemodify(vim.fn.exepath("jdtls"), ":h:h") .. "/share/java/jdtls"
local jdtls_jar = jdtls .. "/plugins/" .. jarname

local config = {
  -- The command that starts the language server
  -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
  cmd = {

    "jdtls",
    -- left(jdk21_exists, "--java-executable", ""), left(jdk21_exists, java[21][1], "")

    -- 💀
    -- 'java', -- or '/path/to/java21_or_newer/bin/java'
            -- depends on if `java` is in your $PATH env variable and if it points to the right version.


    -- '-jar', jdtls_jar,
    -- 💀
    -- '-jar', '/path/to/jdtls_install_location/plugins/org.eclipse.equinox.launcher_VERSION_NUMBER.jar',
         -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
         -- Must point to the                                                     Change this to
         -- eclipse.jdt.ls installation                                           the actual version

    -- "jdtls",

    -- 💀
    -- '-configuration', jdtls .. "config_linux",
    "-configuration", "~/.cache/jdtls/config",
                    -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
                    -- Must point to the                      Change to one of `linux`, `win` or `mac`
                    -- eclipse.jdt.ls installation            Depending on your system.


    -- 💀
    -- See `data directory configuration` section in the README
    '-data', workspace_dir
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  --
  -- vim.fs.root requires Neovim 0.10.
  -- If you're using an earlier version, use: require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
  root_dir = vim.fs.root(0, {".git", "mvnw", "gradlew"}),

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      configuration = {
        runtimes = get_jdks()
      }
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}


require("jdtls").start_or_attach(config)

