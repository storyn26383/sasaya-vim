augroup vue
  autocmd!
  autocmd FileType vue EmmetInstall
  autocmd FileType vue nmap <Leader>f :!yarn eslint --fix %<CR>
augroup END
