local map = vim.keymap.set
local g = vim.g
-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-------------------------------
-- Leader
-------------------------------
g.mapleader = ","

-- remap ESC in insertion mode
map("i", "jk", "<Esc>")
-------------------------------
-- Window managment mappings
-------------------------------
map("n", "<Leader>s", "<C-w>s")
map("n", "<Leader>v", "<C-w>v")
map("n", "<Leader>-", ":botright new<CR><C-w>=", opts)
map("n", "<Leader>|", ":botright vnew<CR><C-w>=", opts)
map("n", "<Leader>q", "<C-w>c")
map("n", "<Leader>c", ":cclose<CR>:lclose<CR>:pclose<CR>", opts)
map("n", "<Leader>t", ":$tabnew<CR>", opts)
map("n", "<Leader>T", ":tabclose<CR>", opts)
map("n", "<Leader>1", "1gt")
map("n", "<Leader>2", "2gt")
map("n", "<Leader>3", "3gt")
map("n", "<Leader>4", "4gt")
map("n", "<Leader>5", "5gt")
map("n", "<Leader>6", "6gt")
map("n", "<Leader>7", "7gt")
map("n", "<Leader>8", "8gt")
map("n", "<Leader>9", "9gt")
map("n", "<Leader>=", "<C-w>=")
map("n", "<Leader>r", "<C-w>r")

-------------------------------
-- Navigation mappings
-------------------------------
map("n", "<Tab>", "<C-w>w")
map("n", "<S-Up>", "<C-W>k")
map("n", "<S-Down>", "<C-W>j")
map("n", "<S-Left>", "<C-W>h")
map("n", "<S-Right>", "<C-W>l")
-- Navigate buffers via 'wildmenu'.
map("n", "<Leader><Tab>", ":buffer<Space><Tab>")
-- Alternate the last two files.
map("n", "<Backspace>", "<C-^>")

-------------------------------
-- Paired mappings
-------------------------------
map("n", "{", "{zz")
map("n", "}", "}zz")
map("n", "n", "nzz")
map("n", "N", "Nzz")
map("n", "[c", "[czz")
map("n", "]c", "]czz")
map("n", "[j", "<C-o>zz")
map("n", "]j", "<C-i>zz")
map("n", "[s", "[szz")
map("n", "]s", "]szz")
map("n", "[z", "zH")

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
-- map('n', '<C-h>', '<C-w>h', opts)
-- map('n', '<C-j>', '<C-w>j', opts)
-- map('n', '<C-k>', '<C-w>k', opts)
-- map('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
map('n', '<C-Up>', ':resize -2<CR>', opts)
map('n', '<C-Down>', ':resize +2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------
-- These mappings allow you to use J and K in visual mode to move lines up and down, respectively.
-- -- map("v", "J", ":m '>+1gv=gv")
-- -- map("v", "K", ":m '<-2gv=gv")
--
