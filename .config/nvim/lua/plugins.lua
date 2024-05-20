-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- colorscheme
    use("rebelot/kanagawa.nvim")

    -- utils
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use {
        "folke/which-key.nvim",
        config = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
            require("which-key").setup {}
        end
    }
    use('tpope/vim-commentary')
    use('tpope/vim-surround')
    use('junegunn/vim-easy-align')

    -- file-related
    use('tpope/vim-eunuch')
    use({
        "stevearc/oil.nvim",
        config = function()
            require("oil").setup()
        end,
    })

    -- git
    use('tpope/vim-fugitive')
    use{'mhinz/vim-signify', as = "signify"}

    -- status line
    use ('nvim-lualine/lualine.nvim')

    -- treesitter
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')

    -- languages
    use('manicmaniac/coconut.vim')

    -- lsp
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},
            {
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'},

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'hrsh7th/cmp-nvim-lsp'},
        }
    }

    -- code formatting
    use({
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup()
        end,
    })
end)
