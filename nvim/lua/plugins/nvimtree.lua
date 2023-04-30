return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  opts = {
    on_attach = function(bufnr)
      local api = require('nvim-tree.api')

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      api.config.mappings.default_on_attach(bufnr)


      vim.keymap.set('n', 'l',  api.node.open.edit,                    opts('Open'))
      vim.keymap.set('n', 'h',  api.node.navigate.parent_close,        opts('Close Directory'))
    end,
  },
  keys = {
    {"<leader>e", "<cmd>NvimTreeToggle<cr>", {silent = true} }
  },
  config = true
}
