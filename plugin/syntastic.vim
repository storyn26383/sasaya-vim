" set statusline+ = %#warningmsg#
" set statusline+ = %{SyntasticStatuslineFlag()}
" set statusline+ = %*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_php_checkers = ['php', 'phpcs']
let g:syntastic_php_phpcs_args = '--standard=psr2'
let g:syntastic_javascript_checkers = ['eslint']
