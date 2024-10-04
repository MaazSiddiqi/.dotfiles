-- turn each entry in disable into shape { "plugin", enabled = false }
-- concat all into one table
local function disable(targets)

  local parsed = {}
  for _, plugin in ipairs(targets) do
    table.insert(parsed, { plugin, enabled = false })
  end
  return parsed
end


return disable({
  "echasnovski/mini.surround",
  "echasnovski/mini.comment",
  "echasnovski/mini.indentscope",
  "nvimdev/dashboard-nvim",
  "dstein64/vim-startuptime",
  "folke/persistence.nvim",
  "akinsho/bufferline.nvim",
  "nvim-neo-tree/neo-tree.nvim",
  "folke/flash.nvim",
})


