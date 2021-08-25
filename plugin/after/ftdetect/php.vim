function! NPhpactorImportClass()
  call phpactor#ImportClass()
endfunction

function! IPhpactorImportClass()
  call NPhpactorImportClass()
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

function! PhpactorGenerateMethod()
  call phpactor#rpc("generate_method", {
    \ "offset": phpactor#_offset(),
    \ "source": phpactor#_source(),
    \ "path": expand('%:p'),
  \ })
endfunction

autocmd FileType php setlocal omnifunc=phpactor#Complete
autocmd FileType php setlocal commentstring=//\ %s
autocmd FileType php setlocal iskeyword-=$
autocmd FileType php setlocal sw=4 sts=4 ts=4

autocmd FileType php imap <buffer><Leader><TAB> <C-X><C-O>
autocmd FileType php nmap <buffer><silent><C-]> :call PhpactorGotoDefinition()<CR>
autocmd FileType php nmap <buffer><silent><C-T> :call PhpactorTraceBack()<CR>
autocmd FileType php nmap <buffer><Leader>a :call phpactor#ContextMenu()<CR>
autocmd FileType php nmap <buffer><Leader>ml :call phpactor#ClassNew()<CR>
autocmd FileType php nmap <buffer><Leader>mt :call phpactor#Transform()<CR>
autocmd FileType php nmap <buffer><Leader>mp :call NPhpactorImportClass()<CR>
autocmd FileType php imap <buffer><Leader>mp <ESC>:call IPhpactorImportClass()<CR>
autocmd FileType php nmap <buffer><Leader>mo :call phpactor#ImportMissingClasses()<CR>
autocmd FileType php nmap <buffer><Leader>me :call NPhpactorExpandClass()<CR>
autocmd FileType php imap <buffer><Leader>me <ESC>:call IPhpactorExpandClass()<CR>
autocmd FileType php nmap <buffer><Leader>mm :call PhpactorGenerateMethod()<CR>
autocmd FileType php nmap <buffer><silent><Leader>mx :call phpactor#ExtractExpression(v:false)<CR>
autocmd FileType php vmap <buffer><silent><Leader>mx :<C-U>call phpactor#ExtractExpression(v:true)<CR>
autocmd FileType php vmap <buffer><silent><Leader>mm :<C-U>call phpactor#ExtractMethod()<CR>
autocmd FileType php nmap <Leader>f :!vendor/bin/php-cs-fixer fix %<CR>

autocmd BufWritePost *.php call UpdateTags()
