-- disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

require("oil").setup({
    default_file_explorer = true,
    columns = {
        "permissions",
        "size",
        "mtime",
    },
})
vim.keymap.set('n', '<leader>o', ":Oil<CR>", { desc = "[O]il" })
