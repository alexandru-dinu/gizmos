vim.opt.background = "dark"
vim.opt.termguicolors = true

require("kanagawa").setup {
    compile = true,
    undercurl = true,
    commentStyle = { italic = false },
    functionStyle = { bold = true },
    keywordStyle = { italic = false },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,
    dimInactive = true,
    terminalColors = true,
    theme = "dragon",
    background = {
        dark = "dragon",
        light = "lotus",
    },
    colors = {
        theme = {
            all = {
                ui = {
                    bg_gutter = "none",
                },
            },
        },
    },
    overrides = function(colors)
        return {
            WinSeparator = { fg = colors.palette.dragonAsh },
        }
    end,
}
vim.cmd.colorscheme("kanagawa")

-- make bg transparent (currently handled by the theme)
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
