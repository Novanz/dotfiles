local map = vim.keymap.set

map("n", "-", "<cmd>Oil --float<CR>", { desc = "Oil" })
-- remap ESC in insertion mode
map("i", "jk", "<Esc>")
map("i", "kj", "<Esc>")

-------------------------------
-- Navigation mappings
-------------------------------
map("n", "<Tab>", "<C-w>w", { desc = "Next window" }) -- next window

map("n", "<Leader><Tab>", ":buffer<Space><Tab>", { desc = "Search for buffers via wildmenu" }) -- buffers via wildmenu
map("n", "<Backspace>", "<C-^>") -- Alternate last two files

-------------------------------
-- Window managment mappings
-------------------------------
map("n", "<Leader>s", "<C-w>s", { desc = "Horizontal split" }) -- h-split
map("n", "<Leader>v", "<C-w>v", { desc = "Vertical split" }) -- v-split
map("n", "<Leader>q", "<C-w>c", { desc = "Hide buffee and close window" }) -- hide buf, and close win
-- map("n", "<Leader>c", ":cclose<CR>:lclose<CR>:pclose<CR>", opts) -- close helper windows
map("n", "<Leader>t", ":$tabnew<CR>", opts) -- new tab
map("n", "<Leader>T", ":tabclose<CR>", opts) -- close tab

vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Float" })
