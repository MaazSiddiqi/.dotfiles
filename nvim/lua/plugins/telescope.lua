return {
  "nvim-telescope/telescope.nvim",
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy=false,
  cmd = "Telescope",
  version = false, -- telescope did only one release, so use HEAD for now
  keys = {
    { "<leader>fj",  "<cmd>Telescope find_files<cr>" },
    { "<leader>fk", "<cmd>Telescope buffers show_all_buffers=true<cr>" },
    { "<leader>/",  "<cmd>Telescope live_grep<cr>" },
    -- find
    { "<leader>fb", "<cmd>Telescope buffers<cr>" },
    { "<leader>:", "<cmd>Telescope oldfiles<cr>" },
    -- search
    { "<leader>fl", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
    { "<leader>fL", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
  },
  opts = {
    defaults = {
      prompt_prefix = " ",
      selection_caret = " ",
      mappings = {
        i = {
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<a-t>"] = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
          end,
          ["<a-i>"] = function()
            Util.telescope("find_files", { no_ignore = true })()
          end,
          ["<a-h>"] = function()
            Util.telescope("find_files", { hidden = true })()
          end,
          ["<C-Down>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-Up>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
        },
        n = {
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
    },
  },
  config = true
}
