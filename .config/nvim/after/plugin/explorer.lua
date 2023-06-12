-- disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
        width = 48,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
    },
})

vim.keymap.set('n', '<leader>et', ":NvimTreeToggle<CR>", { desc = "[E]xplorer [T]oggle" })
vim.keymap.set('n', '<leader>er', ":NvimTreeFindFile<CR>", { desc = "[E]xplorer [R]eveal" })
