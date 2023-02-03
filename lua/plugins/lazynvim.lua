local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
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

-- This is not support by author, but works
-- https://github.com/folke/lazy.nvim/issues/468
-- https://github.com/folke/lazy.nvim/issues/411
-- change default keymaps in lazy floaterm window
local vconf = require('lazy.view.config')
vconf.commands.update.key = "F"
vconf.commands.update.key_plugin = "f"

return require('lazy').setup({
    'nvim-tree/nvim-web-devicons',
    --'rcarriga/nvim-notify',

    { 'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
    },

    { 'akinsho/bufferline.nvim', version = "v3.*",
        dependencies = 'nvim-tree/nvim-web-devicons'
    },

    { 'catppuccin/nvim', name = "catppuccin" },

    { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },

    { 'nvim-telescope/telescope.nvim', version = '0.1.1',
        -- or                        , branch = '0.1.x',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

    -- { 'nvim-tree/nvim-tree.lua',
    --     dependencies = 'nvim-tree/nvim-web-devicons', -- optional, for file icons
    --     -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
    -- },

    { 'nvim-neo-tree/neo-tree.nvim',
        branch = "v2.x",
        dependencies = { 
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
            'MunifTanjim/nui.nvim',
        }
    },

    'ggandor/leap.nvim',
    'numToStr/Comment.nvim',
    'fedepujol/move.nvim',
    'lukas-reineke/indent-blankline.nvim',
    'windwp/nvim-autopairs',

    'numToStr/FTerm.nvim',

    -- autocompletion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',

    -- snippets
    { 'L3MON4D3/LuaSnip',
        -- version = "<CurrentMajor>.*", -- may cause error, follow latest release
        build = "make install_jsregexp", -- install jsregexp (optional!)
    },
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',

    -- DO NOT change the following order
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'neovim/nvim-lspconfig',

})

