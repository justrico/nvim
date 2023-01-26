-- Only required if you have packer configured as `opt`
-- vim.cmd [[ packadd packer.nvim ]]

return require('packer').startup(function(use)
    -- packer can manage it self
    use 'wbthomason/packer.nvim'

    use 'kyazdani42/nvim-web-devicons'
    --use 'rcarriga/nvim-notify'

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        'akinsho/bufferline.nvim', tag = "v3.*",
        requires = 'nvim-tree/nvim-web-devicons'
    }

    -- catppuccin for neovim
    use { "catppuccin/nvim", as = "catppuccin" }
end)

