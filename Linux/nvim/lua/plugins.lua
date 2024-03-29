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
    use { "catppuccin/nvim", as = "catppuccin", run = ":CatppuccinCompile" }

    -- nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require 'user.conf.nvim-tree' end
    }

    -- bufferline
    use {
        'akinsho/bufferline.nvim', 
        tag = "v2.7.0",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require('user.conf.bufferline').setup() end
    }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true },
        config = function() require('user.conf.lualine').setup() end
    }

    -- nvim-treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end,
        config = function() require 'user.conf.treesitter' end
    }

    -- autopairs
    use {
        'windwp/nvim-autopairs',
        config = function() require("nvim-autopairs").setup() end
    }

    -- cmp plugins
    use {
        'hrsh7th/nvim-cmp',
        config = function()  require 'lsp.cmp' end
    }
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

    -- calc
    use 'hrsh7th/cmp-calc'

    -- lsp
    use {
        'williamboman/nvim-lsp-installer',
        config = function() require("nvim-lsp-installer").setup() end
    }

    use {
        'neovim/nvim-lspconfig',
        config = function() require 'lsp.lspconfig'.setup() end
    }

    -- lsp_signature
    use 'ray-x/lsp_signature.nvim'

    -- nvim-navic
    use {
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig",
        config = function() require('lsp.navic').enable() end
    }

    -- nlsp-settings
    --[[
    use {
        'tamago324/nlsp-settings.nvim',
        config = function() require 'lsp.nlsp-settings' end
    }
    ]]

    -- dashboard
    -- use 'glepnir/dashboard-nvim'

    -- alpha-nvim
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function() require 'user.conf.alpha-nvim' end
    }

    -- gitsigns
    use {
        'lewis6991/gitsigns.nvim',
        config = function() require 'user.conf.gitsigns' end
    }

    -- symbols-outline
    use {
        'simrat39/symbols-outline.nvim',
        config = function() require 'user.conf.symbols-outline' end
    }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function() require 'user.conf.telescope' end
    }

    -- workspaces
    use {
        'natecraddock/workspaces.nvim',
        config = function() require 'user.conf.workspaces' end
    }

    -- telescope-ui-select
    use {
        'nvim-telescope/telescope-ui-select.nvim'
    }

    -- leap
    use {
        'ggandor/leap.nvim',
        config = function()
            vim.keymap.set({'n', 'x', 'o'}, '<leader>/', '<Plug>(leap-forward-to)')
            vim.keymap.set({'n', 'x', 'o'}, '<leader>?', '<Plug>(leap-backward-to)')
        end
    }

    -- toggleterm
    use {
        'akinsho/toggleterm.nvim',
        tag = '*',
        config = function() require 'user.conf.toggleterm' end
    }

end)
