function! NPhpactorInsertUse()
  call phpactor#UseAdd()
endfunction

function! IPhpactorInsertUse()
  call NPhpactorInsertUse()
  call feedkeys('a', 'n')
endfunction

function! NPhpactorExpandClass()
  call phpactor#ClassExpand()
endfunction

function! IPhpactorExpandClass()
  call NPhpactorExpandClass()
  call feedkeys('a', 'n')
endfunction

function! PhpactorGotoDefinition()
  if !exists('s:phpactor_trace_stack')
    let s:phpactor_trace_stack = []
  endif

  call add(s:phpactor_trace_stack, [expand('%:p'), line('.'), col('.')])
  call phpactor#GotoDefinition()
endfunction

function! PhpactorTraceBack()
  if !exists('s:phpactor_trace_stack') || empty(s:phpactor_trace_stack)
    return
  endif

  let l:position = remove(s:phpactor_trace_stack, -1)

  silent execute 'e ' . l:position[0]
  call cursor(l:position[1], l:position[2])
endfunction

autocmd FileType php setlocal omnifunc=phpactor#Complete
autocmd FileType php setlocal commentstring=//\ %s
autocmd FileType php setlocal iskeyword-=$
autocmd FileType php setlocal sw=4 sts=4 ts=4
autocmd FileType php command! ClassNew call phpactor#ClassNew()
autocmd FileType php command! Transform call phpactor#Transform()
autocmd FileType php command! References call phpactor#FindReferences()
" autocmd FileType php imap <buffer><Leader><TAB> <C-X><C-O>
" autocmd FileType php nmap <buffer><silent><C-]> :call PhpactorGotoDefinition()<CR>
" autocmd FileType php nmap <buffer><silent><C-T> :call PhpactorTraceBack()<CR>
autocmd FileType php nmap <buffer><Leader>l :call phpactor#ClassNew()<CR>
autocmd FileType php nmap <buffer><Leader>m :call phpactor#ContextMenu()<CR>
autocmd FileType php nmap <buffer><Leader>a :call phpactor#Navigate()<CR>
autocmd FileType php nmap <buffer><Leader>f :call NPhpactorInsertUse()<CR>
autocmd FileType php imap <buffer><Leader>f <ESC>:call IPhpactorInsertUse()<CR>
autocmd FileType php nmap <buffer><Leader>e :call NPhpactorExpandClass()<CR>
autocmd FileType php imap <buffer><Leader>e <ESC>:call IPhpactorExpandClass()<CR>
autocmd FileType php nmap <buffer><silent><Leader>x :call phpactor#ExtractExpression(v:false)<CR>
autocmd FileType php vmap <buffer><silent><Leader>x :<C-U>call phpactor#ExtractExpression(v:true)<CR>
autocmd FileType php vmap <buffer><silent><Leader>m :<C-U>call phpactor#ExtractMethod()<CR>

autocmd BufWritePost *.php call UpdateTags()
