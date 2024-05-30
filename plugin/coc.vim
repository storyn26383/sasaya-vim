let g:coc_global_extensions = [
\   '@yaegassy/coc-volar',
\   '@yaegassy/coc-volar-tools',
\   '@yaegassy/coc-intelephense',
\   'coc-css',
\   'coc-emmet',
\   'coc-json',
\   'coc-tsserver',
\   'coc-graphql',
\   'coc-html',
\ ]

let g:coc_config_home = '~/.vim'

function! CocCheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CocCheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr> <S-TAB>
      \ coc#pum#visible() ?
      \ coc#pum#prev(1) :
      \ "\<C-h>"
inoremap <silent><expr> <CR>
      \ coc#pum#visible() ?
      \ coc#pum#confirm() :
      \ "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

nnoremap <silent> <C-]> <Plug>(coc-definition)
nnoremap <silent> <Leader>r :<C-u>CocList outline<CR>
nnoremap <silent> <Leader>t :<C-u>CocList -I symbols<CR>
vnoremap <silent> <Leader>t "zy:<C-u>CocList -I --input=<C-R>z symbols<CR>
nnoremap <silent> <Leader>v :<C-u>call CocActionAsync('doHover')<CR>
nnoremap <silent> <Leader>mr <Plug>(coc-rename)
nnoremap <silent> <Leader>mf <Plug>(coc-references-used)
nnoremap <silent> <Leader>m= <Plug>(coc-format-selected)
xnoremap <silent> <Leader>m= <Plug>(coc-format-selected)
nnoremap <silent> <Leader>mo :<C-u>call CocAction('runCommand', 'editor.action.organizeImport')<CR>
nnoremap <silent> <Leader>z <Plug>(coc-codeaction)
nnoremap <silent> <Leader>a <Plug>(coc-codeaction-cursor)
xnoremap <silent> <Leader>a <Plug>(coc-codeaction-selected)
nnoremap <silent> <Leader>x :<C-u>CocList commands<CR>
xnoremap <silent> <Leader>x :<C-u>CocList commands<CR>
nnoremap <silent> [d <Plug>(coc-diagnostic-prev-error)
nnoremap <silent> ]d <Plug>(coc-diagnostic-next-error)

if has('patch-8.2.0750') || has('nvim')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1)\<CR>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0)\<CR>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
