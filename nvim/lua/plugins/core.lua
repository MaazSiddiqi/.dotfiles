return {
  { "echasnovski/mini.surround", enabled = false },
  { "ggandor/leap.nvim", enabled = false },
  { "ggandor/flit.nvim", enabled = false },
  { "rcarriga/nvim-notify", enabled = false },
  { "echasnovski/mini.indentscope", enabled = false },
  { "folke/which-key.nvim", enabled = false },

  {
    "LazyVim/LazyVim",
    opts = {
      defaults = {
        keymaps = false, -- lazyvim.config.keymaps
      },
    },
  },
}
