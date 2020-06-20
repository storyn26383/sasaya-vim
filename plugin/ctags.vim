function! UpdateTags()
  let tags = 'tags'

  if filereadable(tags)
    let file = substitute(expand('%:p'), getcwd() . '/', '', '')

    " remove tags of file
    call system('sed -ri "/\s+' . escape(file, './') . '/d"' . tags)

    " append tags of file
    call system('ctags -a "' . file . '"')
  endif
endfunction

command! Ctags call system('ctags --recurse --exclude=vendor --exclude=node_modules --exclude=public --exclude="*.json" --exclude="*.min.*" && ctags --recurse --exclude=bin --exclude=node_modules --exclude="*.json" --exclude="*.min.*" -f tags.vendor vendor &')
