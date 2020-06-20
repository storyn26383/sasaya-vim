function! CheckCaseType(string)
  " abc abc
  if a:string =~ ' '
    return 0
  endif

  " abc-abc
  if a:string =~ '-'
    return 1
  endif

  " abc.abc
  if a:string =~ '\.'
    return 2
  endif

  " abc_abc
  if a:string =~# '_' && a:string !~# '[A-Z]'
    return 3
  endif

  " ABC_ABC
  if a:string =~# '_' && a:string !~# '[a-z]'
    return 4
  endif

  " abcAbc
  if a:string =~# '^[a-z0-9]\+\([A-Z0-9][a-z0-9]*\)*$'
    return 5
  endif

  " AbcAbc
  if a:string =~# '^\([A-Z0-9][a-z0-9]*\)\+$'
    return 6
  endif

  return -1
endfunction

function! CoerceString()
  normal! gv"zy

  let l:string = @z
  let l:origin_type = CheckCaseType(l:string)
  let l:target_type = (l:origin_type + 1) % 7

  if l:origin_type >= 5
    let l:string = substitute(l:string, '\([a-z0-9]\)\([A-Z0-9]\)\C', '\1 \2', 'g')
  endif

  let l:mapping = [' ', '-', '.', '_', '_', '_', '_']
  let l:words = split(l:string, '[ -._]')
  let l:string = join(l:words, l:mapping[l:target_type])

  if l:target_type == 4
    let l:string = toupper(l:string)
  else
    let l:string = tolower(l:string)
  endif

  if l:target_type >= 5
    let l:string = substitute(l:string, '_\([A-Za-z0-9]\)', '\U\1', 'g')
  endif

  if l:target_type == 6
    let l:string = substitute(l:string, '^[A-Za-z]', '\U\0', '')
  end

  let @z = l:string

  normal! gv"zpgv
endfunction

nnoremap <Leader>c viw:call CoerceString()<CR>
vnoremap <Leader>c :call CoerceString()<CR>
