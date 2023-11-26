local map = vim.keymap.set

vim.g.mapleader = " "

-- spellcheck
map("n", "<leader>ss", ":setlocal spell!<CR>", {silent = true, desc = "Toggle spellcheck"})
map("n", "<leader>sn", "]s", {desc = "Spell Next"})
map("n", "<leader>sp", "[s", {desc = "Spell Prev"})
map("n", "<leader>sc", "z=", {desc = "Spell Correct"})