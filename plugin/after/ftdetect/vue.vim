augroup vue
  autocmd!
  autocmd FileType vue EmmetInstall
  autocmd FileType vue nmap <buffer><Leader>f :!npx eslint --fix '%' && npx prettier --write '%'<CR>
augroup END
