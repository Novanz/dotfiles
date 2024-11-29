local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- require("lazy").setup({})

require("lazy").setup({
    {
         'bluz71/nvim-linefly' ,
         lazy = false,
    },

    {
        "bluz71/vim-moonfly-colors", 
        name = "moonfly", 
        lazy = false,
        priority = 1000 
    },

    {
       "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "BufReadPre",
        -- config = function()
        --   require("gitsigns")
        -- end     
    },
})
