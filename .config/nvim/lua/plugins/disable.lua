DISABLED = {
  "echasnovski/mini.surround",
  "echasnovski/mini.comment",
  "echasnovski/mini.indentscope",
  "nvimdev/dashboard-nvim",
  "dstein64/vim-startuptime",
  "folke/persistence.nvim",
  "akinsho/bufferline.nvim",
  "nvim-neo-tree/neo-tree.nvim",
  "folke/flash.nvim",
}

-- turn each entry in disable into shape { "plugin", enabled = false }
-- concat all into one table
local function processDisabled()

  local disabled = {}
  for _, plugin in ipairs(DISABLED) do
    table.insert(disabled, { plugin, enabled = false })
  end
  return disabled
end


return processDisabled()


