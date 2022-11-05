local opts = { noremap = true, silent = true }

--[[ local term_opts = { silent = true } ]]

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- NORMAL --
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


-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- -- LSP / Format / Buffers
-- keymap("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
-- keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
-- keymap("n", "<leader>k", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
-- keymap("n", "<leader>s", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
-- keymap("n", "<leader>p", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
-- keymap("n", "<leader>P", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
-- keymap("n", "<leader>l", "<cmd>CodeActionMenu<CR>", opts)
-- keymap("n", "<leader>;", "<cmd>bd<CR>", opts)
-- keymap("n", "<leader>z", "zR", opts)

-- -- Extensions
-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
-- keymap("n", "<leader>F", "<cmd>Telescope live_grep<cr>", opts)
-- --[[ keymap("n", "<leader>p", "<cmd>Telescope registers<cr>", opts) ]]
-- keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)

-- keymap("n", "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
-- keymap("n", "gpt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", opts)
-- keymap("n", "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", opts)
-- keymap("n", "gP", "<cmd>lua require('goto-preview').close_all_win()<CR>", opts)
-- keymap("n", "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", opts)


-- keymap("n", "<leader>oo", "<cmd>TSLspOrganize<CR>", opts)
-- keymap("n", "<leader>or", "<cmd>TSLspRenameFile<CR>", opts)
-- keymap("n", "<leader>oa", "<cmd>TSLspImportAll<CR>", opts)
