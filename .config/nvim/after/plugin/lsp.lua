local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

local cmp = require('cmp')
cmp.setup({
    sources = cmp.config.sources({
        { name = 'buffer' },
        { name = 'path' },
        { name = 'nvim_lsp' },
    }),
    mapping = {
        ['<C-y>'] = cmp.mapping.confirm({select = true}),
    }
})
