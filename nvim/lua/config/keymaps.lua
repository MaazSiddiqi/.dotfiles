-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
function has(plugin)
  return require("lazy.core.config").plugins[plugin] ~= nil
end

local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

map("i", "jk", "<esc>", { silent = true })

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>")
map("n", "<C-Down>", "<cmd>resize -2<cr>")
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>")

-- Move Lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- theprimeagen's saner behaviour keymaps
map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- greatest remap ever
map("x", "<leader>p", [["_dP]])
-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", [["_d]])

-- Keep cursor at the bottom of the visual selection after you yank it.
map("v", "y", "ygv<Esc>")

-- map("n", "<C-k>", "<cmd>cnext<CR>zz")
-- map("n", "<C-j>", "<cmd>cprev<CR>zz")
-- map("n", "<leader>k", "<cmd>lnext<CR>zz")
-- map("n", "<leader>j", "<cmd>lprev<CR>zz")

-- buffers
if has("bufferline.nvim") then
  map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>")
  map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>")
  map("n", "[b", "<cmd>BufferLineCyclePrev<cr>")
  map("n", "]b", "<cmd>BufferLineCycleNext<cr>")
else
  map("n", "<S-h>", "<cmd>bprevious<cr>")
  map("n", "<S-l>", "<cmd>bnext<cr>")
  map("n", "[b", "<cmd>bprevious<cr>")
  map("n", "]b", "<cmd>bnext<cr>")
end

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map("n", "<leader>ur", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>")

map({ "n", "x" }, "gw", "*N")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true })
map("x", "n", "'Nn'[v:searchforward]", { expr = true })
map("o", "n", "'Nn'[v:searchforward]", { expr = true })
map("n", "N", "'nN'[v:searchforward]", { expr = true })
map("x", "N", "'nN'[v:searchforward]", { expr = true })
map("o", "N", "'nN'[v:searchforward]", { expr = true })

-- Add undo break-points
map("i", ",", ",<c-g>u")
map("i", ".", ".<c-g>u")
map("i", ";", ";<c-g>u")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>L", "<cmd>:Lazy<cr>")

map("n", "<leader>xl", "<cmd>lopen<cr>")
map("n", "<leader>xq", "<cmd>copen<cr>")

if not has("trouble.nvim") then
  map("n", "[q", vim.cmd.cprev)
  map("n", "]q", vim.cmd.cnext)
end

-- highlights under cursor
if vim.fn.has("nvim-0.9.0") == 1 then
  map("n", "<leader>ui", vim.show_pos)
end

-- windows
map("n", "<leader>ww", "<C-W>p")
map("n", "<leader>wd", "<C-W>c")
map("n", "<leader>w-", "<C-W>s")
map("n", "<leader>w|", "<C-W>v")
map("n", "<leader>-", "<C-W>s")
map("n", "<leader>|", "<C-W>v")

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>")
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>")
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>")
map("n", "]<tab>", "<cmd>tabnext<cr>")
map("n", "<leader><tab>d", "<cmd>tabclose<cr>")
map("n", "[<tab>", "<cmd>tabprevious<cr>")

-- lsp
map("n", "<leader>lF", "<cmd>lua vim.lsp.buf.format()<cr>")
