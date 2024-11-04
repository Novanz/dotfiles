local opt = vim.opt
local map = vim.keymap.set

-- Optionen
opt.number = true -- Show line numbers


-- Mappings

-- These mappings allow you to use J and K in visual mode to move lines up and down, respectively.
map("v", "J", ":m '>+1gv=gv")
map("v", "K", ":m '<-2gv=gv")
