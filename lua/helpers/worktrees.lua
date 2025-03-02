
local LinkedWorkTree = {}
LinkedWorkTree.__index = LinkedWorkTree

function LinkedWorkTree.new(worktree, head, branch)
  local instance = { worktree = worktree, head = head, path = branch }
  setmetatable(instance, LinkedWorkTree)
end

local GitWorkTree = {}
GitWorkTree.__index = GitWorkTree


function GitWorkTree:new()
  local instance = {
    trees = {},
  }
  setmetatable(instance, GitWorkTree)
  return instance
end

function GitWorkTree.refresh_list(self)
  return vim.system(
    { "git", "worktree", "list", "--porcelain" },
    { text = true },
    function(obj)
      local input = obj.stdout
      if input == nil then return end

      self.trees = {}

      for section in input:gmatch("worktree [^\n]+.-\n\n") do
        local worktree = {}
        for key, value in section:gmatch("(%w+) ([^\n]+)") do
          worktree[key] = value
        end
        table.insert(self.trees, worktree)
      end
      vim.print(self.trees[1]["branch"])
    end
  )
end

-- git = GitWorkTree:new()
-- git:refresh_list()

