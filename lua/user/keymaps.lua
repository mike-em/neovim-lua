local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", opts)
-- keymap("n", "<C-i>", "<C-i>", opts)

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
keymap("n", "<leader>r", ":q<CR>", opts)
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

-- Navigation
keymap("n", "<leader>a", ":Alpha<CR>", opts)

-- Comments
-- keymap("n", "<leader>/", "gcc", opts)
-- I hate typing these
-- keymap("n", "H", "^", opts)
-- keymap("n", "L", "$", opts)
-- keymap("v", "H", "^", opts)
-- keymap("v", "L", "$", opts)
-- keymap("x", "H", "^", opts)
-- keymap("x", "L", "$", opts)
-- keymap("o", "H", "^", opts)
-- keymap("o", "L", "$", opts)

-- keymap("n", "n", "nzzzv", opts)
-- keymap("n", "N", "Nzzzv", opts)

-- Naviagate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- keymap("n", "<RightMouse>", ":Alpha<CR>", opts)

-- Move text up and down
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-j>", ":m .+1<CR>==", opts)
-- keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
-- keymap("v", "P", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Custom

-- keymap("n", "-", ":lua require'lir.float'.toggle()<cr>", opts)
-- keymap("n", "<C-\\>", "<cmd>vsplit<cr>", opts)
-- vim.cmd[[nnoremap c* /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn]]
-- vim.cmd[[nnoremap c# ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN]]
-- keymap("n", "c*", [[/\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn]], opts)
-- keymap("n", "c#", [[?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN]], opts)
-- keymap("n", "gx", [[:execute '!brave ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)
-- keymap("n", "gx", [[:silent execute '!$BROWSER ' . shellescape(expand('<cfile>'), 1)<CR>]], opts)
-- Change '<CR>' to whatever shortcut you like :)
-- vim.api.nvim_set_keymap("n", "<CR>", "<cmd>NeoZoomToggle<CR>", { noremap = true, silent = true, nowait = true })
-- vim.api.nvim_set_keymap("n", "=", "<cmd>JABSOpen<cr>", { noremap = true, silent = true, nowait = true })

-- alt binds
-- keymap("n", "<m-s>", "<cmd>split<cr>", opts)
-- keymap("n", "<m-v>", "<cmd>lua require('lsp_lines').toggle()<cr>", opts)
-- keymap("n", "<m-q>", "<cmd>:q<cr>", opts)

-- vim.api.nvim_set_keymap("n", "<m-b>", "<cmd>lua require('user.bfs').open()<cr>", opts)
-- vim.api.nvim_set_keymap("n", "<m-b>", "<cmd>JABSOpen<cr>", opts)
-- vim.api.nvim_set_keymap("n", "<m-e>", "NvimTreeToggle<cr>", opts)
-- vim.api.nvim_set_keymap(
--   "n",
--   "<m-f>",
--   "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
--   opts
-- )
-- Comment
keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

-- vim.api.nvim_set_keymap(
--   "n",
--   "<tab>",
--   "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
--   opts
-- )

-- vim.api.nvim_set_keymap("n", "<tab>", "<cmd>lua require('telescope.builtin').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>", opts)

-- vim.api.nvim_set_keymap("n", "<tab>", "<cmd>lua require('telescope').extensions.harpoon.marks(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal', prompt_title='Harpoon'})<cr>", opts)
-- vim.api.nvim_set_keymap("n", "<s-tab>", "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false, initial_mode='normal'})<cr>", opts)
-- vim.api.nvim_set_keymap("n", "<tab>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
-- vim.api.nvim_set_keymap("n", "<m-g>", "<cmd>Telescope git_branches<cr>", opts)
-- vim.api.nvim_set_keymap("n", "<s-enter>", "<cmd>TodoQuickFix<cr>", opts)
-- l = { "<cmd>lua require('user.bfs').open()<cr>", "Buffers" },

-- l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
