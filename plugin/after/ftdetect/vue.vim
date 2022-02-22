augroup vue
  autocmd!
  autocmd FileType vue EmmetInstall
  autocmd FileType vue nmap <buffer><Leader>f :!yarn eslint --fix % && prettier --write --list-different %<CR>
augroup END
