-- local colorscheme = 'moonfly'
-- local colorscheme = "catppuccin-latte"
-- local colorscheme = "catppuccin-frappe"
-- local colorscheme = "catppuccin-macciato"
-- local colorscheme = "catppuccin-mocha"
local colorscheme = "onedark"

local is_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not is_ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found!')
    return
end
