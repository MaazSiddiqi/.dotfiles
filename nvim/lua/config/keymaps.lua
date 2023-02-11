-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- TODO: Add descriptions

local function map(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end
local opts = { noremap = true, silent = true }

map("n", "<leader>ft", "<Nop>", {})
map("n", "<leader>fT", "<Nop>", {})
map("n", "<leader>fn", "<Nop>", {})
map("n", "<leader>fe", "<Nop>", {})
map("n", "<leader>fE", "<Nop>", {})

map("i", "jk", "<ESC>", { desc = "Enter normal mode" })

map("i", "<Tab>", 'copilot#Accept("")', { desc = "Accept copilot suggestion", silent = true, expr = true })

map("n", "dtb", "dt)", opts)
map("n", "dtB", "dt}", opts)
map("n", "dTb", "dT(", opts)
map("n", "dTB", "dT{", opts)

map("o", "tb", "t)", opts)
map("o", "tB", "t}", opts)
map("o", "Tb", "T(", opts)
map("o", "TB", "T{", opts)

map("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
map("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
map("n", "<leader>;", "<cmd>bd<CR>", opts)
map("n", "<leader><leader>;", '<cmd>w|%bd|e#|bd!#|normal`"<CR><CR>', opts)

map("n", "Y", "y$", opts)
