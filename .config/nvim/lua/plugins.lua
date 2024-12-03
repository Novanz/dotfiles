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

require("lazy").setup({

    -----------------------------
    -- Colorscheme plugins
    -----------------------------

    {
        'navarasu/onedark.nvim', 
        lazy = true, 
        config = function()
          require("config.onedark")
        end,     
    },
    {
        "bluz71/vim-moonfly-colors", 
        name = "moonfly", 
        lazy = true,
        priority = 1000 
    },
    { 
        "catppuccin/nvim", 
        name = "catppuccin",
        lazy = true, 
        priority = 1000 
    },

    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 1000,
        opts = {},
    },
    -----------------------------
    -- Style plugins
    -----------------------------
    {
        'bluz71/nvim-linefly' ,
        lazy = false,
        config = function()
            require("config.nvim-linefly")
        end,     
    },
    {
        "nvim-tree/nvim-web-devicons",
        event = "VeryLazy",
        -- config = function()
        --   require("config.devicons")
        -- end,
    },
 
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "BufReadPre",
        config = function()
            require("config.indent-blankline")
        end,
    },

    {
       "lewis6991/gitsigns.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "BufReadPre",
        config = function()
          require("config.gitsigns")
        end     
    },

    -----------------------------
    -- Utils
    -----------------------------
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      keys = {
        {
          "<leader>?",
          function()
            require("which-key").show({ global = false })
          end,
          desc = "Buffer Local Keymaps (which-key)",
        },
      },
    },
    -- Vscode-like pictograms
	{
		"onsails/lspkind.nvim",
		event = { "VimEnter" },
	},

    {
        "jedrzejboczar/possession.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "VeryLazy",
        config = function()
          require("config.possession")
        end,
    },
  -----------------------------
  -- Filesystem plugins
  -----------------------------
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "MunifTanjim/nui.nvim",
          {
            "s1n7ax/nvim-window-picker",
            version = "2.*",
            config = function()
              require("config.window-picker")
            end,
          },
        },
        event = "VeryLazy",
        config = function()
          require("config.neo-tree")
        end,
    },

     {
    "otavioschwanck/arrow.nvim",
    keys = { ";" },
    opts = {
      show_icons = true,
      global_bookmarks = true,
      leader_key = ";",
    },
  },

    -----------------------------
  -- Fuzzy finding plugins
  -----------------------------
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",
          { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        keys = { "<Space>" },
        config = function()
          require("config.telescope")
        end,
        },
    -----------------------------
    -- Auto-completion plugins
    -----------------------------
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp", -- lsp auto-completion
			"hrsh7th/cmp-buffer", -- buffer auto-completion
			"hrsh7th/cmp-path", -- path auto-completion
			"hrsh7th/cmp-cmdline", -- cmdline auto-completion
		},
		config = function()
			require("config.nvim-cmp")
		end,
	},
    -- Code snippet engine
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},

    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("config.autopairs")
        end,
    },


  -----------------------------
  -- Treesitter plugins
  -----------------------------
    {
        "nvim-treesitter/nvim-treesitter",
        tag = "v0.9.3",
        -- commit = "3de418e",
        build = ":TSUpdate",
        dependencies = {
            { "RRethy/nvim-treesitter-endwise", name = "nvim-ts-endwise" },
        },
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require("config.treesitter")
        end,
    },


    -----------------------------
    -- Behavior plugins
    -----------------------------
    {
        "tpope/vim-unimpaired",
        keys = { "[", "]" },
        config = function()
            require("config.unimpaired")
        end,
    },
    
    -----------------------------
    -- Development plugins
    -----------------------------
    {
        "neovim/nvim-lspconfig",
        event = "BufReadPre",
        config = function()
            require("config.lsp-config")
        end,
    },

    {
        "mfussenegger/nvim-lint",
        config = function()
            require("config.lint")
        end,
    },

    {
        "stevearc/conform.nvim",
        config = function()
            require("config.conform")
        end,
    },

    {
        "williamboman/mason.nvim",
        config = function()
            require("config.mason")
        end,
    },

})
