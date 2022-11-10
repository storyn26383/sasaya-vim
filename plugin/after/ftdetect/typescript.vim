augroup typescript
  autocmd!
  autocmd FileType typescript nmap <buffer><Leader>f :!npx eslint --fix '%' && npx prettier --write '%'<CR>
augroup END
