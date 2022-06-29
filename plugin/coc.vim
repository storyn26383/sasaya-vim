let g:coc_global_extensions = [
\   '@yaegassy/coc-volar',
\   '@yaegassy/coc-volar-tools',
\   'coc-css',
\   'coc-emmet',
\   'coc-json',
\   'coc-phpls',
\   'coc-tsserver',
\   'coc-xml',
\   'coc-graphql',
\ ]

imap <silent><expr><Leader><TAB> coc#refresh()
nmap <silent><C-]> <Plug>(coc-definition)
nmap <silent><Leader>r :<C-u>CocList outline<CR>
nmap <silent><Leader>t :<C-u>CocList -I symbols<CR>
nmap <silent><Leader>v :<C-u>call CocActionAsync('doHover')<CR>
nmap <silent><Leader>mr <Plug>(coc-rename)
nmap <silent><Leader>mf <Plug>(coc-references-used)
nmap <silent><Leader>m= <Plug>(coc-format-selected)
xmap <silent><Leader>m= <Plug>(coc-format-selected)
nmap <silent><Leader>mo :<C-u>call CocAction('runCommand', 'editor.action.organizeImport')<CR>
nmap <silent><Leader>z <Plug>(coc-codeaction)
nmap <silent><Leader>a <Plug>(coc-codeaction-cursor)
xmap <silent><Leader>a <Plug>(coc-codeaction-selected)
nmap <silent><Leader>x :<C-u>CocList commands<CR>
xmap <silent><Leader>x :<C-u>CocList commands<CR>
