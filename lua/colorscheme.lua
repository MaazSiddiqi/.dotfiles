vim.g.onedarker_italic_keywords = false

vim.g.onedarker_italic_functions = false

vim.g.onedarker_italic_comments = true

vim.g.onedarker_italic_loops = false

vim.g.onedarker_italic_conditionals = false

-- Example config in lua
vim.g.nord_contrast = false
vim.g.nord_borders = false
vim.g.nord_disable_background = false
vim.g.nord_italic = false
vim.g.nord_uniform_diff_background = true

local colorscheme = "nord"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
