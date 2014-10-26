if exists('trailing_whitespace_loaded')
  finish
endif
let trailing_whitespace_loaded = 1

if has("autocmd")
  augroup trailing-whitespace
    autocmd BufWritePost * call trailingWhitespace#preserve(":call trailingWhitespace#check()")
  augroup end
endif

nnoremap _$ :call trailingWhitespace#preserve("%s/\\s\\+$//e")<CR>
