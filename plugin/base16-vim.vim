if filereadable(expand('~/.vimrc_background'))
  let base16colorspace = 256
  let g:airline_theme = 'base16'

  source ~/.vimrc_background

  " override cursorline style
  " hi CursorLineNr term=bold cterm=bold ctermfg=20 ctermbg=18 gui=bold guifg=#b4b7b4 guibg=#282a2e
endif
