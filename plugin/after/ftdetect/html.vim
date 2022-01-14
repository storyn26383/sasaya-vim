augroup html
  autocmd!
  autocmd FileType html setlocal iskeyword+=-
  autocmd FileType html let b:coc_additional_keywords = ["-"]
augroup END
