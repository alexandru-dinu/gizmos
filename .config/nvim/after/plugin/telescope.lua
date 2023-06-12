local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', function()
    builtin.find_files({ hidden = true });
end,
{ desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind [G]rep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind [B]uffers' })
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = '[G]it [F]iles' })

-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
