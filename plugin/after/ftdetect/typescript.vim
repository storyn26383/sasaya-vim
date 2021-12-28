augroup typescript
  autocmd!
  autocmd FileType typescript nmap <buffer><Leader>f :!yarn eslint --fix %<CR>
augroup END
