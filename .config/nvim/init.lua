-- GENERAL {{{
vim.opt.shortmess:append({ I = true })
vim.opt.showmode = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.magic = false
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- delete whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})
-- }}}

-- KEYMAPS {{{
vim.g.mapleader = " "

-- spellcheck
vim.keymap.set("n", "<leader>ss", ":setlocal spell!<CR>", {silent = true, desc = "Toggle spellcheck"})
vim.keymap.set("n", "<leader>sn", "]s", {desc = "Spell Next"})
vim.keymap.set("n", "<leader>sp", "[s", {desc = "Spell Prev"})
vim.keymap.set("n", "<leader>sc", "z=", {desc = "Spell Correct"})
-- }}}

-- PLUGINS {{{

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
-- }}}

-- vim:foldmethod=marker:foldlevel=0
