-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL --
keymap("n", "<leader><leader>R", ':so $MYVIMRC<CR>:echo "successfully sourced VIMRC"<CR>', opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

keymap("n", "dtb", "dt)", opts)
keymap("n", "dtB", "dt}", opts)
keymap("n", "dTb", "dT(", opts)
keymap("n", "dTB", "dT{", opts)

-- INSERT --
-- Press jk fast to exit insert mode
keymap("i", "jk", "<ESC>", opts)

-- VISUAL --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- VISUAL BLOCK --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- LSP / Format / Buffers
keymap("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
keymap("n", "<leader>;", "<cmd>bd<CR>", opts)
keymap("n", "<leader><leader>;", "<cmd>w|%bd|e#|bd!#|normal`\"<CR><CR>", opts)

-- Extensions
keymap("n", "<leader>f", "<cmd>Telescope find_files hidden=true<cr>", opts)
keymap("n", "<leader>F", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>p", "<cmd>Telescope registers<cr>", opts)
keymap("n", "<leader>b", "<cmd>Telescope buffers<cr>", opts)
keymap("n", "<leader>:", "<cmd>Telescope oldfiles<cr>", opts)
keymap("n", "<leader>L", "<cmd>Telescope diagnostics<cr>", opts)
keymap("n", "<leader>/", "<cmd>Telescope current_buffer_fuzzy_find<cr>", opts)
-- keymap("v", "<leader>rr", "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>", opts)

keymap("n", "<leader>ai", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
keymap("n", "<leader>aa", ':lua require("harpoon.mark").add_file()<CR>', opts)
keymap("n", "<leader>aj", ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
keymap("n", "<leader>ak", ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
keymap("n", "<leader>al", ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
keymap("n", "<leader>a;", ':lua require("harpoon.ui").nav_file(4)<CR>', opts)
keymap("n", "<leader>an", ':lua require("harpoon.ui").nav_next()<CR>', opts)
keymap("n", "<leader>ap", ':lua require("harpoon.ui").nav_prev()<CR>', opts)

keymap("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", opts)
keymap("n", "<leader>E", "<cmd>NvimTreeToggle<cr>", opts)

keymap("n", "<leader>G", "<cmd>LazyGit<cr>", opts)
keymap("n", "<leader>go", "<cmd>Octo actions<cr>", opts)
keymap("n", "<leader>gj", "<cmd>Gitsigns next_hunk<cr>", opts)
keymap("n", "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>", opts)
keymap("n", "<leader>gi", "<cmd>Gitsigns preview_hunk<cr>", opts)
keymap("n", "<leader>gI", "<cmd>Gitsigns preview_hunk_inline<cr>", opts)
keymap("n", "<leader>gw", "<cmd>Gitsigns stage_hunk<cr>", opts)
keymap("n", "<leader>gW", "<cmd>Gitsigns stage_buffer<cr>", opts)
keymap("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<cr>", opts)
keymap("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>", opts)
keymap("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", opts)
keymap("o", "ih", ":<C-U>Gitsigns select_hunk<CR>", opts)
keymap("x", "ih", ":<C-U>Gitsigns select_hunk<CR>", opts)

keymap("n", "<leader>z", "<cmd>ZenMode<cr>", opts)
