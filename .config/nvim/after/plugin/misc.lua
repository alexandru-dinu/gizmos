-- tpope/vim-fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [S]tatus" })

-- junegunn/vim-easy-align
vim.keymap.set("x", "ga", "<Plug>(EasyAlign)", { silent = true, desc = "[G]o [A]lign" })
