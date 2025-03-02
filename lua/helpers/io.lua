

local CommandHandler = {}
CommandHandler.__index = CommandHandler

function CommandHandler:new(o)
  o = o or {}
  setmetatable(o, self)
  self.__index = self
  return o
end

function CommandHandler.on_stdout(self, f)
  self.stdout_handler = f
end

function CommandHandler.on_stderr(self, f)
  self.stderr_handler = f
end

function CommandHandler.call(self, command, ...)

  if command == nil then
    vim.print("CommandHandler invalid command:", command)
    return
  end

  if self.stdout_handler == nil and self.stderr_handler == nil then
    vim.print("CommandHandler requires either a STDOUT or STDERR handler.")
    return
  end

  local uv = vim.uv or vim.loop
  local stdin = uv.new_pipe()
  local stdout = uv.new_pipe()
  local stderr = uv.new_pipe()
  local options = {
    args = {...},
    stdio = { stdin, stdout, stderr }
  }

  local handle
  local on_exit = function(status, signal)
    if status ~= 0 then
      vim.print("CommandHandler exited with error:", status)
    end
    uv.close(stdin)

    uv.close(handle)
  end

  handle = uv.spawn(command, options, on_exit)

  stdout:read_start(function(err, data)
    if err then
      return
    end
    if data then
      if self.stdout_handler ~= nil then
        self.stdout_handler(data)
      end
    else
      uv.read_stop(stdout)
      uv.close(stdout)
    end
  end)
  stderr:read_start(function(err, data)
    if err then
      return
    end
    if data then
      if self.stderr_handler ~= nil then
        self.stderr_handler(data)
      end
    else
      uv.read_stop(stderr)
      uv.close(stderr)
    end
  end)

  return handle
end

-- local ch = CommandHandler:new()
-- ch:on_stdout(vim.print)
-- ch:call("git", "worktree", "list")

return CommandHandler

