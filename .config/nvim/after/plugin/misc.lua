-- tpope/vim-fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it [S]tatus" })

-- junegunn/vim-easy-align
vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { silent = true, desc = "[G]o [A]lign" })
