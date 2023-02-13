let g:copilot_no_tab_map = v:true

inoremap <silent><script><expr> <Leader>mc copilot#Accept("\<CR>")

" linux
inoremap <silent><script><expr> <M-]> copilot#Next()
inoremap <silent><script><expr> <M-[> copilot#Previous()
inoremap <silent><script><expr> <M-Bslash> copilot#Suggest()

" mac
inoremap <silent><script><expr> “ copilot#Next()
inoremap <silent><script><expr> ‘ copilot#Previous()
inoremap <silent><script><expr> « copilot#Suggest()
