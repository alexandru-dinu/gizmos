local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

lsp.setup()

local cmp = require("cmp")
cmp.setup({
	sources = cmp.config.sources({
		{ name = "buffer" },
		{ name = "path" },
		{ name = "nvim_lsp" },
	}),
	mapping = {
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
	},
})

-- code formatting
require("conform").setup({
	formatters_by_ft = {
		-- formatters are run sequentially
		lua = { "stylua" },
		python = { "autoflake", "isort", "black" },
	},
})
require("conform").formatters.autoflake = {
	prepend_args = { "--remove-all-unused-imports" },
}
vim.keymap.set(
	"n",
	"<leader>cf",
	[[:lua require("conform").format()<CR>]],
	{ noremap = true, silent = true, desc = "Code Format" }
)
