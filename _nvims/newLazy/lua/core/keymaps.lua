local function map(mode, lhs, rhs, opts)
	vim.keymap.set(mode, lhs, rhs, opts)
end

map("i", "jk", "<ESC>", { desc = "Enter normal mode" })

-- better up/down
map("n", "j", "v:count == 0 ? 'gj' : 'j'", {
	expr = true,
	silent = true,
})
map("n", "k", "v:count == 0 ? 'gk' : 'k'", {
	expr = true,
	silent = true,
})

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", {
	desc = "Go to left window",
})
map("n", "<C-j>", "<C-w>j", {
	desc = "Go to lower window",
})
map("n", "<C-k>", "<C-w>k", {
	desc = "Go to upper window",
})
map("n", "<C-l>", "<C-w>l", {
	desc = "Go to right window",
})

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", {
	desc = "Increase window height",
})
map("n", "<C-Down>", "<cmd>resize -2<cr>", {
	desc = "Decrease window height",
})
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", {
	desc = "Decrease window width",
})
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", {
	desc = "Increase window width",
})

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", {
	desc = "Move down",
})
map("n", "<A-k>", "<cmd>m .-2<cr>==", {
	desc = "Move up",
})
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", {
	desc = "Move down",
})
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", {
	desc = "Move up",
})
map("v", "<A-j>", ":m '>+1<cr>gv=gv", {
	desc = "Move down",
})
map("v", "<A-k>", ":m '<-2<cr>gv=gv", {
	desc = "Move up",
})

-- buffers
-- map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", {
--     desc = "Prev buffer"
-- })
-- map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", {
--     desc = "Next buffer"
-- })
-- map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", {
--     desc = "Prev buffer"
-- })
-- map("n", "]b", "<cmd>BufferLineCycleNext<cr>", {
--     desc = "Next buffer"
-- })
map("n", "<S-h>", "<cmd>bprevious<cr>", {
	desc = "Prev buffer",
})
map("n", "<S-l>", "<cmd>bnext<cr>", {
	desc = "Next buffer",
})
map("n", "[b", "<cmd>bprevious<cr>", {
	desc = "Prev buffer",
})
map("n", "]b", "<cmd>bnext<cr>", {
	desc = "Next buffer",
})
-- map("n", "<leader>bb", "<cmd>e #<cr>", {
--     desc = "Switch to Other Buffer"
-- })
-- map("n", "<leader>`", "<cmd>e #<cr>", {
--     desc = "Switch to Other Buffer"
-- })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", {
	desc = "Escape and clear hlsearch",
})

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map("n", "<leader>ur", "<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>", {
	desc = "Redraw / clear hlsearch / diff update",
})

map("n", "gw", "*N")
map("x", "gw", "*N")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", {
	expr = true,
	desc = "Next search result",
})
map("x", "n", "'Nn'[v:searchforward]", {
	expr = true,
	desc = "Next search result",
})
map("o", "n", "'Nn'[v:searchforward]", {
	expr = true,
	desc = "Next search result",
})
map("n", "N", "'nN'[v:searchforward]", {
	expr = true,
	desc = "Prev search result",
})
map("x", "N", "'nN'[v:searchforward]", {
	expr = true,
	desc = "Prev search result",
})
map("o", "N", "'nN'[v:searchforward]", {
	expr = true,
	desc = "Prev search result",
})

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- lazy
map("n", "<leader>L", "<cmd>Lazy<cr>", {
	desc = "Lazy",
})

map("n", "<leader>xl", "<cmd>lopen<cr>", {
	desc = "Location List",
})
map("n", "<leader>xq", "<cmd>copen<cr>", {
	desc = "Quickfix List",
})

-- -- lazygit
-- map("n", "<leader>gg", function()
--     Util.float_term({ "lazygit" }, {
--         cwd = Util.get_root()
--     })
-- end, {
--     desc = "Lazygit (root dir)"
-- })
-- map("n", "<leader>gG", function()
--     Util.float_term({ "lazygit" })
-- end, {
--     desc = "Lazygit (cwd)"
-- })

-- windows
map("n", "<leader>ww", "<C-W>p", {
	desc = "Other window",
})
map("n", "<leader>wd", "<C-W>c", {
	desc = "Delete window",
})
map("n", "<leader>wj", "<C-W>s", {
	desc = "Split window below",
})
map("n", "<leader>wl", "<C-W>v", {
	desc = "Split window right",
})

-- tabs
map("n", "<leader><tab>l", "<cmd>tablast<cr>", {
	desc = "Last Tab",
})
map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", {
	desc = "First Tab",
})
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", {
	desc = "New Tab",
})
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", {
	desc = "Close Tab",
})
map("n", "<leader>]<tab>", "<cmd>tabnext<cr>", {
	desc = "Next Tab",
})
map("n", "<leader>[<tab>", "<cmd>tabprevious<cr>", {
	desc = "Previous Tab",
})

map("i", "<Tab>", 'copilot#Accept("")', { desc = "Accept copilot suggestion", silent = true, expr = true })

map("n", "dtb", "dt)", { silent = true })
map("n", "dtB", "dt}", { silent = true })
map("n", "dTb", "dT(", { silent = true })
map("n", "dTB", "dT{", { silent = true })

map("o", "tb", "t)", { silent = true })
map("o", "tB", "t}", { silent = true })
map("o", "Tb", "T(", { silent = true })
map("o", "TB", "T{", { silent = true })

map("n", "<leader>d", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true })
map("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { silent = true })
map("n", "<leader>;", "<cmd>bd<CR>", { silent = true })
map("n", "<leader><leader>;", '<cmd>w|%bd|e#|bd!#|normal`"<CR><CR>', { silent = true })

map("n", "Y", "y$", { silent = true })
--
-- lazygit
-- map("n", "<leader>G", function()
-- 	Util.float_term({ "lazygit" })
-- end, { desc = "Open LazyGit" })
-- lazy
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })
map("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP buffer info" })
