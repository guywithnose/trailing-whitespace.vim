" vim: filetype=vim

" Detect whitespace at the end of lines
" If whitespace is found it is highlighted and a warning is shown
function! trailingWhitespace#check()
  let _s=@/
  let l = line(".")
  let c = col(".")
  let searchCount = 0
  normal G$
  let flags = "w"
  while search('\s\+$', flags)
    normal j0
    let searchCount += 1
    let flags = "W"
  endwhile
  highlight default TrailingWhitespace ctermbg=red guibg=red
  if searchCount > 0
    echo 'Found' searchCount 'lines with trailing whitespace. Use _$ to remove it.'
    match TrailingWhitespace /\s\+$/
  else
    " Once the whitespace is removed we can hide the highlighting so that is
    " isn't distracting while editing
    match TrailingWhitespace /$^/
  endif
  let @/=_s
  call cursor(l, c)
endfunction

function! trailingWhitespace#strip()
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction
