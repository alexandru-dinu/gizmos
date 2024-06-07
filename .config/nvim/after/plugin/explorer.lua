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
    view_options = {
        show_hidden = true,
    },
})
vim.keymap.set('n', '-', "<CMD>Oil<CR>", { desc = "Open parent dir" })
vim.keymap.set('n', '<leader>-', require("oil").toggle_float, { desc = "Open parent dir (float)" })
