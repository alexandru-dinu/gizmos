local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
    'lua_ls',
    'rust_analyzer',
    'pylsp',
    'pyright',
})

lsp.setup()

-- language-specific configs
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup(lsp.nvim_lua_ls())
lspconfig.pylsp.setup{
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = {'E501', 'E402'},
                }
            }
        }
    }
}

local cmp = require('cmp')
cmp.setup({
    mapping = {
        ['<C-y>'] = cmp.mapping.confirm({select = true}),
    }
})
