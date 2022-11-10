augroup javascript
  autocmd!
  autocmd FileType javascript nmap <buffer><Leader>f :!npx eslint --fix '%' && npx prettier --write '%'<CR>
augroup END
