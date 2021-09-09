augroup dart
  autocmd!
  autocmd FileType dart setlocal commentstring=//\ %s
  " autocmd FileType dart nmap <buffer><silent><Leader>g :silent !kill -SIGUSR1 `pgrep -f "flutter_tools.snapshot run"`<CR>:redraw!<CR>
augroup END
