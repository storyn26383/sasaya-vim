if has_key(g:plugs, 'base16-vim')
  let base16colorspace = 256
  let g:airline_theme = 'base16'

  colorscheme base16-tomorrow-night

  " override cursorline style
  hi CursorLineNr term=bold cterm=bold ctermfg=20 ctermbg=18 gui=bold guifg=#b4b7b4 guibg=#282a2e
endif
