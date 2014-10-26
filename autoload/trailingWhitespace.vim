" vim: filetype=vim

" Detect whitespace at the end of lines
" If whitespace is found it is highlighted and a warning is shown
function! trailingWhitespace#check()
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
endfunction

" Run a command without moving the cursor or changing the current search
" pattern
function! trailingWhitespace#preserve(command)
  let _s=@/
  let l = line(".")
  let c = col(".")
  execute a:command
  let @/=_s
  call cursor(l, c)
endfunction
