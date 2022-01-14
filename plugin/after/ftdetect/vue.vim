augroup vue
  autocmd!
  autocmd FileType vue nmap <buffer><Leader>f :!yarn eslint --fix %<CR>
augroup END
