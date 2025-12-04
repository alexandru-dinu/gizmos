-- disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

require("oil").setup {
    default_file_explorer = true,
    columns = {
        "permissions",
        "size",
        "mtime",
    },
    view_options = {
        show_hidden = true,
    },
}
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent dir" })
vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Open parent dir (float)" })

require("nvim-tree").setup {
    update_focused_file = { enable = true },
    view = { width = "20%" },
    filters = { git_ignored = false, dotfiles = false },
    renderer = {
        highlight_opened_files = "all",
        indent_markers = { enable = true },
        icons = {
            show = {
                file = false,
                folder = false,
                folder_arrow = false,
                -- git = false,
                -- modified = false,
                -- diagnostics = false,
                -- bookmarks = false,
            },
            git_placement = "before",
        },
    },
}
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, desc = "Toggle NvimTree" })
