nnoremap <buffer> <leader>cf :!autoflake -i --remove-all-unused-imports % && isort % && black %<CR>
