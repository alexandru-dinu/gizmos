vim.opt.background = "dark"
vim.opt.termguicolors = true

require('kanagawa').setup{
    compile = false,
    undercurl = true,
    commentStyle = { italic = false, fg = "#5e5e5e" },
    functionStyle = { bold = true },
    keywordStyle = { italic = false },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,
    dimInactive = false,
    terminalColors = true,
    theme = "dragon",
    background = {
        dark = "dragon",
        light = "lotus"
    },
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none"
                }
            }
        }
    }
}
vim.cmd("colorscheme kanagawa")

-- make bg transparent (currently handled by the theme)
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
