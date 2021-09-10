augroup javascript
  autocmd!
  autocmd FileType javascript nmap <buffer><Leader>f :!yarn eslint --fix %<CR>
augroup END
