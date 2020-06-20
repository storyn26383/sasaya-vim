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
nmap <silent><C-]> :call CocGotoDefinition()<CR>
nmap <silent><C-T> :call CocTraceBack()<CR>
nmap <silent><Leader>v :call CocActionAsync('doHover')<CR>
nmap <silent><Leader>R <Plug>(coc-references)
