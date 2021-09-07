function! CocGotoDefinition()
  if !exists('s:coc_trace_stack')
    let s:coc_trace_stack = []
  endif

  call add(s:coc_trace_stack, [expand('%:p'), line('.'), col('.')])
  call CocActionAsync('jumpDefinition')
endfunction

function! CocTraceBack()
  if !exists('s:coc_trace_stack') || empty(s:coc_trace_stack)
    return
  endif

  let l:position = remove(s:coc_trace_stack, -1)

  silent execute 'e ' . l:position[0]
  call cursor(l:position[1], l:position[2])
endfunction

imap <silent><expr><Leader><TAB> coc#refresh()
nmap <silent><C-]> :<C-u>call CocGotoDefinition()<CR>
nmap <silent><C-T> :<C-u>call CocTraceBack()<CR>
nmap <silent><Leader>r :<C-u>CocList outline<CR>
nmap <silent><Leader>t :<C-u>CocList -I symbols<CR>
nmap <silent><Leader>v :<C-u>call CocActionAsync('doHover')<CR>
nmap <silent><Leader>mr :<C-u>call CocActionAsync('rename')<CR>
nmap <silent><Leader>mf :<C-u>call CocActionAsync('jumpUsed')<CR>
nmap <silent><Leader>m= :<C-u>call CocActionAsync('format')<CR>
vmap <silent><Leader>m= :<C-u>call CocActionAsync('formatSelected', visualmode())<CR>
nmap <silent><Leader>mo :<C-u>call CocActionAsync('runCommand', 'editor.action.organizeImport')<CR>
nmap <silent><Leader>a :CocAction<CR>
vmap <silent><Leader>a :CocAction<CR>
nmap <silent><Leader>x :CocCommand<CR>
vmap <silent><Leader>x :CocCommand<CR>
