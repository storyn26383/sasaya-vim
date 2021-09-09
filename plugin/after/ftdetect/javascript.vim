augroup javascript
  autocmd!
  autocmd FileType javascript nmap <Leader>f :!yarn eslint --fix %<CR>
augroup END
