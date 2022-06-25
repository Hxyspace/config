return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- gruvbox theme
    -- use 'morhetz/gruvbox'
    use 'ellisonleao/gruvbox.nvim'

    -- nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- bufferline
    use {
        'akinsho/bufferline.nvim', 
        requires = 'kyazdani42/nvim-web-devicons'
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- autopairs
    use 'windwp/nvim-autopairs'

    -- cmp plugins
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'    -- buffer completions
    use 'hrsh7th/cmp-path'      -- path completions
    use 'hrsh7th/cmp-cmdline'   -- cmdline completions
    use 'hrsh7th/cmp-nvim-lsp'

    -- vsnip
    use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
    use 'hrsh7th/vim-vsnip'

    -- lsp
    use {
        'williamboman/nvim-lsp-installer',
        'neovim/nvim-lspconfig',
    }

end)