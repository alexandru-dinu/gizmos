-- Bootstrap lazy.nvim {{{
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system { "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath }
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)
-- }}}

-- GENERAL {{{
vim.opt.shortmess:append { I = true }
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
vim.opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.magic = false
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append "@-@"

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
vim.keymap.set("n", "<leader>ss", ":setlocal spell!<CR>", { silent = true, desc = "Toggle spellcheck" })
vim.keymap.set("n", "<leader>sn", "]s", { desc = "Spell Next" })
vim.keymap.set("n", "<leader>sp", "[s", { desc = "Spell Prev" })
vim.keymap.set("n", "<leader>sc", "z=", { desc = "Spell Correct" })

-- buffers
vim.keymap.set("n", "grb", "<CMD>buffer #<CR>", { desc = "[g]o to [r]ecent [b]uffer" })
vim.keymap.set("n", "<leader>bd", "<CMD>bdelete<CR>", { desc = "[b]uffer [d]elete" })

-- repl/compilation mode
vim.keymap.set("n", "<leader>p", function()
    local mp = vim.fn.input("Set makeprg: ", vim.bo.makeprg or "")
    if mp ~= "" then
        vim.bo.makeprg = mp
    end
end, { desc = "Set makeprg" })

vim.keymap.set("n", "<leader>m", function()
    vim.cmd "silent make | copen | wincmd p"
end, { desc = "Make" })
-- }}}

-- PLUGINS {{{
require("lazy").setup {
    spec = {
        -- Colorscheme
        "rebelot/kanagawa.nvim",

        -- Utils
        {
            "nvim-telescope/telescope.nvim",
            tag = "v0.2.0",
            dependencies = { "nvim-lua/plenary.nvim" },
        },
        {
            "folke/which-key.nvim",
            config = function()
                vim.o.timeout = true
                vim.o.timeoutlen = 300
                require("which-key").setup {}
            end,
        },
        {
            "folke/todo-comments.nvim",
            dependencies = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup {}
            end,
        },
        "tpope/vim-commentary",
        "tpope/vim-surround",
        "junegunn/vim-easy-align",

        -- File-related
        "tpope/vim-eunuch",
        "stevearc/oil.nvim",
        "nvim-tree/nvim-tree.lua",

        -- Git
        "tpope/vim-fugitive",
        { "mhinz/vim-signify", name = "signify" },

        -- Status line
        "nvim-lualine/lualine.nvim",

        -- Treesitter
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
        },
        "nvim-treesitter/playground",

        -- Languages
        { "manicmaniac/coconut.vim", ft = "coco" },
        { "factor/factor.vim", ft = "factor" },

        -- LSP/Completion
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",

        -- Code formatting
        {
            "stevearc/conform.nvim",
            config = function()
                require("conform").setup()
            end,
        },
    },
    install = {},
    checker = { enabled = true },
}
-- }}}

-- vim:foldmethod=marker:foldlevel=0
