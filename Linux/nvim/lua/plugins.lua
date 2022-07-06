local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

require('packer').init({
    git = {
        default_url_format = 'git@github.com:%s'
    }
})

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

    -- nvim-treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        -- run = ':TSUpdate'
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
    -- use 'hrsh7th/cmp-vsnip'    -- { name = 'vsnip' }
    -- use 'hrsh7th/vim-vsnip'

    -- luasnip
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    -- lsp
    use {
        'williamboman/nvim-lsp-installer',
        'neovim/nvim-lspconfig',
    }

    -- dashboard
    -- use 'glepnir/dashboard-nvim'

    -- alpha-nvim
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' }
    }

    -- gitsigns
    use {
        'lewis6991/gitsigns.nvim',
    }

    -- symbols-outline
    use 'simrat39/symbols-outline.nvim'

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

end)
