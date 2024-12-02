local env = vim.env
local exists = vim.fn.exists
local fn = vim.fn
local g = vim.g
local opt = vim.opt

-- Hint: use `:h <option>` to figure out the meaning if needed
-- Copy to/from system clipboard
if fn.has("unnamedplus") == 1 then
  opt.clipboard = { "unnamed", "unnamedplus" }
else
  opt.clipboard = "unnamed"
end
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.mouse = 'a'                 -- allow the mouse to be used in Nvim

-- Tab
opt.tabstop = 4                 -- number of visual spaces per TAB
opt.softtabstop = 4             -- number of spacesin tab when editing
opt.shiftwidth = 4              -- insert 4 spaces on a tab
opt.expandtab = true            -- tabs are spaces, mainly because of python

-- UI config
opt.number = true               -- show absolute number
opt.relativenumber = true       -- add numbers to each line on the left side
opt.cursorline = true           -- highlight cursor line underneath the cursor horizontally
opt.colorcolumn = { 81, 101 } -- Highlight 81 and 82 columns
opt.splitbelow = true           -- open new vertical split bottom
opt.splitright = true           -- open new horizontal splits right
-- opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
-- opt.showmode = false            -- we are experienced, wo don't need the "-- INSERT --" mode hint

-- Searching
opt.incsearch = true            -- search as characters are entered
opt.hlsearch = false            -- do not highlight matches
opt.ignorecase = true           -- ignore case in searches by default
opt.smartcase = true            -- but make it case sensitive if an uppercase is entered

-- Set the persistent undo directory on temporary private fast storage.
local undo_dir = "/tmp/.nvim_undodir_" .. env.USER
if fn.isdirectory(undo_dir) ~= 1 then
  fn.mkdir(undo_dir, "", "0700")
end
opt.undodir = undo_dir
opt.undofile = true -- Maintain undo history
