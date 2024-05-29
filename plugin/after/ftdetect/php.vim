if !exists('g:php_cs_fixer_command')
  let g:php_cs_fixer_command = 'vendor/bin/pint % || vendor/bin/php-cs-fixer fix'
endif

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

function! PhpactorGenerateMethod()
  call phpactor#rpc("generate_method", {
    \ "offset": phpactor#_offset(),
    \ "source": phpactor#_source(),
    \ "path": expand('%:p'),
  \ })
endfunction

function! PhpactorRenamveVariable()
  call phpactor#rpc("rename_variable", {
    \ "offset": phpactor#_offset(),
    \ "source": phpactor#_source(),
    \ "path": expand('%:p'),
    \ "name_suggestion": expand("<cword>"),
  \ })
endfunction

augroup php
  autocmd!

  autocmd FileType php setlocal iskeyword-=$
  autocmd FileType php setlocal commentstring=//\ %s
  autocmd FileType php setlocal sw=4 sts=4 ts=4

  autocmd FileType php nmap <buffer><Leader>x :call phpactor#ContextMenu()<CR>
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

  autocmd FileType php nmap <buffer><Leader>f :exec '!' . g:php_cs_fixer_command . ' ' . expand('%')<CR>

  " duplicate previous method
  autocmd FileType php nmap <buffer><Leader>mc [[V]]ky]]]]Pwwciw
augroup END
