local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)

-- Tabs --
keymap("n", "<leader>c", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)
keymap("n", "<leader>ra", ":%bd|e#|bd#<cr>", opts)

keymap("n", "<tab>", ":bnext<cr>", opts)
keymap("n", "<s-tab>", ":bprevious<cr>", opts)

-- Resize split
keymap("n", "<leader>\\", ":vertical resize +5<CR>", opts)
keymap("n", "<leader>`", ":vertical resize -5<CR>", opts)

-- Splits
keymap("n", "<leader>;", ":vsplit<CR>", opts)
keymap("n", "<leader>=", ":split<CR>", opts)

-- Closing
keymap("n", "<leader>q", ":qa<CR>", opts)
keymap("n", "<leader>t", ":q<CR>", opts)
keymap("n", "<leader>w", ":w<CR>", opts)

-- Highlights
keymap("n", "<leader>n", ":noh<CR>", opts)

-- NerdTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>ft", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)

-- Git
keymap("n", "<leader>gg", ":Git<CR>", opts)
keymap("n", "<leader>gd", ":Gdiffsplit<CR>", opts)
keymap("n", "<leader>gt", ":Git difftool<CR>", opts)
keymap("n", "<leader>gb", ":Git blame<CR>", opts)

-- Git conflicts
keymap("n", "<leader>gdd", ":Gdiffsplit!<CR>", opts)
keymap("n", "<leader>gss", ":diffget /2<CR>", opts)
keymap("n", "<leader>gll", ":diffget /3<CR>", opts)

-- UndoTree
keymap("n", "<leader>ut", ":UndotreeToggle<CR>", opts)

-- Alpha
keymap("n", "<leader>a", ":Alpha<CR>", opts)

-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle.linewise.current()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>', opts)

-- Find and replace --
keymap("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Swap windows horizontal --
keymap("n", "H", "<C-w>H")
keymap("n", "L", "<C-w>L")

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
