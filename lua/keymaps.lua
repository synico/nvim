local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
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
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
--keymap("n", "<C-tab>", "<c-6>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Custom
-- nvimtree
keymap("n", "<F2>", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>nt", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>si", ":NvimTreeResize +5<CR>", opts)
keymap("n", "<leader>sd", ":NvimTreeResize -5<CR>", opts)
-- bufferline
keymap("n", "<m-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<m-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts)
keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts)
keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts)
keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts)
keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts)
keymap("n", "<leader>ct", ":BufferLinePickClose<CR>", opts)
-- telescope
local telebuiltin = require('telescope.builtin')
vim.keymap.set('n', 'ff', telebuiltin.find_files, {})
vim.keymap.set('n', 'fg', telebuiltin.live_grep, {})
vim.keymap.set('n', 'fb', telebuiltin.buffers, {})
vim.keymap.set('n', 'fh', telebuiltin.help_tags, {})


