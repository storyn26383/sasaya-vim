augroup java
  autocmd!
  autocmd FileType java setlocal noexpandtab
  autocmd FileType java nmap <buffer><Leader>f :!mvn spring-javaformat:apply<CR>
augroup END
