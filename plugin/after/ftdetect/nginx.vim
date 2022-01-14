augroup nginx
  autocmd!
  autocmd BufRead,BufNewFile *.nginx setlocal ft=nginx
  autocmd BufRead,BufNewFile nginx*.conf setlocal ft=nginx
  autocmd BufRead,BufNewFile *nginx.conf setlocal ft=nginx
  autocmd BufRead,BufNewFile */etc/nginx/* setlocal ft=nginx
  autocmd BufRead,BufNewFile */usr/local/nginx/conf/* setlocal ft=nginx
  autocmd BufRead,BufNewFile */nginx/*.conf setlocal ft=nginx
augroup END
