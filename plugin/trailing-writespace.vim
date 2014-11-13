if exists('trailing_whitespace_loaded')
  finish
endif
let trailing_whitespace_loaded = 1

if has("autocmd")
  augroup trailing-whitespace
    autocmd BufWritePost * :execute "if &ft != 'gitcommit' \| :call trailingWhitespace#check()"
  augroup end
endif

nnoremap _$ :call trailingWhitespace#strip()<CR>
