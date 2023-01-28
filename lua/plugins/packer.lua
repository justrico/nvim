-- Only required if you have packer configured as `opt`
-- vim.cmd [[ packadd packer.nvim ]]

return require('packer').startup(function(use)
    -- packer can manage it self
    use 'wbthomason/packer.nvim'

    use 'kyazdani42/nvim-web-devicons'
    --use 'rcarriga/nvim-notify'

    use { 'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use { 'akinsho/bufferline.nvim', tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    }

    use { "catppuccin/nvim", as = "catppuccin" }

    use { 'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons', -- optional, for file icons
        -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
end)

