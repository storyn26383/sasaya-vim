let g:fzf_layout = { 'down': '30%' }

command! -bang -nargs=* Commits call fzf#vim#commits({'options': '--no-reverse'})
command! -bang -nargs=* BTags call fzf#vim#buffer_tags('', {'options': '--no-reverse'})
command! -bang -nargs=* BCommits call fzf#vim#buffer_commits({'options': '--no-reverse'})
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--ignore "*.lock"', fzf#vim#with_preview({'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all'}))

nmap <silent> <C-P> :Files<CR>
nmap <silent> <Leader>b :Buffers<CR>
imap <silent> <C-X><C-K> <Plug>(fzf-complete-word)
imap <silent> <C-X><C-F> <Plug>(fzf-complete-path)
imap <silent> <C-X><C-J> <Plug>(fzf-complete-file-ag)
imap <silent> <C-X><C-L> <Plug>(fzf-complete-line)
