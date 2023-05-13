local telescopeBorderless = function(flavor)
  local cp = require("catppuccin.palettes").get_palette(flavor)

  return {
    TelescopeBorder = { fg = cp.mantle, bg = cp.mantle },
    TelescopeSelectionCaret = { fg = cp.lavender, bg = cp.base },
    TelescopeMatching = { fg = cp.lavender },
    TelescopeNormal = { bg = cp.mantle },
    TelescopeSelection = { fg = cp.blue, bg = cp.base },
    TelescopeMultiSelection = { fg = cp.text, bg = cp.mantle },

    TelescopeTitle = { fg = cp.green, bg = cp.mantle },
    TelescopePreviewTitle = { fg = cp.red, bg = cp.mantle },
    TelescopePromptTitle = { fg = cp.mauve, bg = cp.mantle },

    TelescopePromptNormal = { fg = cp.lavender, bg = cp.mantle },
    TelescopePromptBorder = { fg = cp.mantle, bg = cp.mantle },
  }
end

return {
  -- { "shaunsingh/nord.nvim" },
  -- {
  --   "olimorris/onedarkpro.nvim",
  --   priority = 1000, -- Ensure it loads first
  -- },
  { "AlexvZyl/nordic.nvim" },

  {
    "catppuccin/nvim",
    config = function()
      require("catppuccin").setup({
        highlight_overrides = {
          latte = telescopeBorderless("latte"),
          frappe = telescopeBorderless("frappe"),
          macchiato = telescopeBorderless("macchiato"),
          mocha = telescopeBorderless("mocha"),
        },
      })
    end,
    lazy = false,
    priority = 1000,
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
      -- colorscheme = "catppuccin-macchiato",
      -- colorscheme = function()
      --   require("nordic").load()
      -- end,
    },
  },
}
