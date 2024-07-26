-- LSP
local lsp = require("lsp-zero").preset {}

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps { buffer = bufnr }
end)

lsp.setup()

-- COMPLETION
local cmp = require "cmp"
cmp.setup {
    sources = cmp.config.sources {
        { name = "buffer" },
        { name = "path" },
        { name = "nvim_lsp" },
    },
    mapping = {
        ["<C-y>"] = cmp.mapping.confirm { select = true },
    },
}

-- CODE FORMATTING
require("conform").setup {
    formatters_by_ft = {
        -- formatters are run sequentially
        lua = { "stylua" },
        python = { "autoflake", "isort", "black" },
    },
}
require("conform").formatters = {
    autoflake = {
        prepend_args = { "--remove-all-unused-imports" },
    },
    black = {
        prepend_args = { "--line-length=100" },
    },
    stylua = {
        prepend_args = { "--indent-type", "Spaces" },
    },
}
vim.keymap.set(
    "n",
    "<leader>cf",
    [[:lua require("conform").format({ async = true })<CR>]],
    { noremap = true, silent = false, desc = "Code Format" }
)
