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

    'numToStr/FTerm.nvim',
})

