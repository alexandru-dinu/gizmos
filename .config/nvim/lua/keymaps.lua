local map = vim.keymap.set

vim.g.mapleader = " "

-- set compile command
map("n", "<leader>cc", ":set makeprg=", {desc = "Compile Command"})
map("n", "<leader>co", ":copen<CR>", {desc = "Compile Open (quickfix window)"})
map("n", "<leader>cm", ":make | copen<CR>", {desc = "Compile Make"})

-- replace selection
map("x", "<leader>rs", "y:%s/<C-r><C-r>\"//g<Left><Left>", {desc = "Replace selection"})

-- spellcheck
map("n", "<leader>ss", ":setlocal spell!<CR>", {silent = true, desc = "Toggle spellcheck"})
map("n", "<leader>sn", "]s", {desc = "Spell Next"})
map("n", "<leader>sp", "[s", {desc = "Spell Prev"})
map("n", "<leader>sc", "z=", {desc = "Spell Correct"})
