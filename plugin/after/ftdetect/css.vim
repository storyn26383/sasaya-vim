augroup css
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
  autocmd FileType css let b:coc_additional_keywords = ["-"]
augroup END
