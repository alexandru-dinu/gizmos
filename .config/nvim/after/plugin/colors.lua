vim.opt.background = "dark"
vim.opt.termguicolors = true

require("gruvbox").setup({
    bold = true,
    italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
    },
    contrast = "soft",
    transparent_mode = true,
})
vim.cmd('colorscheme gruvbox')

-- make bg transparent (currently handled by the theme)
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
