" =================
"  vim-plug
" =================

call plug#begin('~/.vim/plugged')

" Plgins
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'storyn26383/vim-autoclose'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'

Plug 'StanAngeloff/php.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

Plug 'digitaltoad/vim-pug'
" Plug 'jwalton512/vim-blade'

Plug 'pangloss/vim-javascript'
" Plug 'kchmck/vim-coffee-script'

Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'wavded/vim-stylus'

" Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'

Plug 'storyn26383/vim-vue'

Plug 'scrooloose/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

call plug#end()

" =================
"  settings
" =================

set nocompatible                      " not compatible with the old-fashion vi mode
set backspace=2                       " allow backspacing over everything in insert nc >kkmode
set history=1000                      " keep 1000 lines of command line history
set undolevels=100
set autoread                          " auto read when file is changed from outside
set hidden                            " switch buffers without saving
set splitright                        " always open vertical split window in the right side
set splitbelow                        " always open horizontal split window below
set nostartofline
set switchbuf=useopen
set scrolloff=4                       " start scrolling when n lines away from margins
" set clipboard+=unnamed

set ttyfast                           " send more chars while redrawing
set lazyredraw                        " speedup vim
set timeoutlen=1000
set ttimeoutlen=0

set nobomb                            " no BOM (Byte Order Mark)
set key=                              " disable encryption
set viminfo=                          " disable .viminfo file
set nobackup                          " no *~ backup files
set noswapfile
set nowritebackup

" visual
set shortmess=Ia                      " remove splash wording
set ruler                             " show the cursor position all the time
set wrap
set linebreak
set nolist
set cursorline
set showmatch
set number
set numberwidth=4
" set relativenumber
set title
set showcmd
set noshowmode
set showtabline=2                     " always show tab line (the very top line)
set laststatus=2                      " always show status line (the very bottom line)
set synmaxcol=256

" auto completion
set wildmenu                          " make tab completion for files/buffers act like bash
set wildmode=longest,list             " use emacs-style tab completion when selecting files, etc
set completeopt=menuone

" folding
set foldenable
set foldmethod=indent
set foldlevel=100

" search
set hlsearch                          " search highlighting
set incsearch                         " incremental search
set ignorecase                        " ignore case when searching
set smartcase

" indent
set autoindent
set copyindent                        " copy the previous indentation on autoindenting
set smarttab                          " insert tabs on the start of a line according to
set expandtab                         " replace <TAB> with spaces
set softtabstop=2                     " tab indent size
set shiftwidth=2                      " auto indent size
set tabstop=2                         " tab character size

" disable sound on errors
set visualbell
set noerrorbells
set t_vb=
set tm=500

" gui
set t_Co=256
set guifont=Source\ Code\ Pro:h15     " only available for the GUI version
set linespace=3                       " only available for the GUI version
set guioptions-=l                     " remove gui scrollbar
set guioptions-=L
set guioptions-=r
set guioptions-=R

" file encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1,euc-jp,utf-16le,latin1
set fenc=utf-8 enc=utf-8 tenc=utf-8
scriptencoding utf-8

" ignores
set wildignore+=*.o,*.obj,*.pyc                " output objects
set wildignore+=*.png,*.jpg,*.gif,*.ico        " image format
set wildignore+=*.swf,*.fla                    " image format
set wildignore+=*.mp3,*.mp4,*.avi,*.mkv        " media format
set wildignore+=*.git*,*.hg*,*.svn*            " version control system
set wildignore+=*sass-cache*
set wildignore+=*.DS_Store
set wildignore+=log/**
set wildignore+=tmp/**

" theme
filetype plugin indent on
syntax on
colorscheme tomorrow-night

" cursorline switched while focus is switched to another split window
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" remove tailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" auto update tags
function! UpdateTags()
  let tags = 'tags'

  if filereadable(tags)
    let file = substitute(expand('%:p'), getcwd() . '/', '', '')

    " remove tags of file
    call system('sed -ri "/\s+' . escape(file, './') . '/d" ' . tags)

    " append tags of file
    call system('ctags -a --kinds-php=citf "' . file . '"')
  endif
endfunction

autocmd BufWritePost *.php call UpdateTags()

" filetype
autocmd FileType php setlocal sw=4 sts=4 ts=4
" autocmd BufNewFile,BufRead *.vue setlocal ft=javascript
" autocmd BufRead,BufNewFile,BufReadPre *.jade let g:indentLine_enabled=0

" auto complete
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" =================
"  plugin settings
" =================

" fzf
command! -bang -nargs=* Commits call fzf#vim#commits({'options': '--no-reverse'})
command! -bang -nargs=* BTags call fzf#vim#buffer_tags('', {'options': '--no-reverse'})
command! -bang -nargs=* BCommits call fzf#vim#buffer_commits({'options': '--no-reverse'})
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, '--hidden', {'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all'})
let g:fzf_colors={
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment']
  \ }

" airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s: '
let g:airline_theme = 'tomorrow'

" NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeChDirMode = 2
let NERDTreeMouseMode = 2
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden = 1
let NERDTreeShowBookmarks = 0
let NERDTreeIgnore = ['\.git$', '\.DS_Store$']
let g:NERDTreeWinSize = 30
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_open_on_gui_startup = 0

" php cs fixer
let g:php_cs_fixer_level = 'psr2'
let g:php_cs_fixer_enable_default_mapping = 0

" syntastic
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

" supertab
let g:SuperTabCrMapping = 1
" let g:SuperTabDefaultCompletionType = '<C-X><C-O>'
" let g:SuperTabContextDefaultCompletionType = '<C-X><C-O>'

" ultisnips
let g:UltiSnipsJumpForwardTrigger = '<TAB>'
let g:UltiSnipsJumpBackwardTrigger = '<S-TAB>'

" tcomment
if exists('*tcomment#DefineType')
  call tcomment#DefineType('pug', '//- %s')
endif

" php namespace
let g:php_namespace_sort = "'{,'}-1!awk '{print length, $0}' | sort -n | cut -d' ' -f2-"
let g:php_namespace_sort_after_insert = 1

" php complete
" let g:phpcomplete_index_composer_command = 'composer'

" neocomplete
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" if !exists('g:neocomplete#keyword_patterns')
"   let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endif
" let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'

" emmet
let g:user_emmet_leader_key = ','

" vue
let g:tcommentGuessFileType_vue = 'pug'
let g:user_emmet_settings = { 'vue': { 'extends': 'css' } }

" ack.vim
" if executable('ag')
"   let g:ackprg = 'ag --ignore "*.lock" --vimgrep'
" endif

" =================
"  key remap
" =================

" leader key
let mapleader = ','
let g:mapleader = ','

" do not use the error keys
" map <BS> <NOP>
" map <UP> <NOP>
" map <DOWN> <NOP>
" map <LEFT> <NOP>
" map <RIGHT> <NOP>
" imap <BS> <NOP>
" imap <UP> <NOP>
" imap <DOWN> <NOP>
" imap <LEFT> <NOP>
" imap <RIGHT> <NOP>

" command mode
cmap <C-A> <HOME>
cmap <C-E> <END>
cnoremap <C-B> <LEFT>
cnoremap <C-D> <DEL>
cnoremap <C-F> <RIGHT>
cnoremap <C-H> <BS>
cnoremap <C-N> <DOWN>
cnoremap <C-P> <UP>
cnoremap <ESC><C-B> <S-LEFT>
cnoremap <ESC><C-F> <S-RIGHT>

" easy escaping to normal mode
" imap jj <esc>

" fast save
nmap <Leader>s :w<CR>

" tig
" nmap <Leader>g :!tig<CR>
nmap <Leader>B :exec '!tig blame % +'.line('.')<CR>

" ctags
nmap <Leader>c :!ctags --recurse --kinds-php=citf &<CR>

" close buffer
nmap <Leader>w :bd<CR>

" fold
nmap <Leader>k1 :set foldlevel=0<CR>
nmap <Leader>k2 :set foldlevel=1<CR>
nmap <Leader>k3 :set foldlevel=2<CR>
nmap <Leader>k4 :set foldlevel=3<CR>
nmap <Leader>k5 :set foldlevel=4<CR>
nmap <Leader>k6 :set foldlevel=5<CR>
nmap <Leader>k7 :set foldlevel=6<CR>
nmap <Leader>k8 :set foldlevel=7<CR>
nmap <Leader>k9 :set foldlevel=8<CR>
nmap <Leader>k0 :set foldlevel=100<CR>

" fast asign variable
nmap <Leader>v yiw/}<CR>O$this-><ESC>pa = $<ESC>pa;<ESC>?__construct<CR>Oprotected $<ESC>pa;<CR><ESC>/__construct<CR>/<C-R>"<CR>:nohl<CR>

" omni complete
imap <Leader><TAB> <C-X><C-O>

" go to definition
" nmap g] g<C-]>
nmap g] <C-]>
nmap g[ <C-T>

" identation
nmap g. v>
nmap g, v<
vmap g. >gv
vmap g, <gv

" move lines up and down using ctrl+[jk]
nmap <C-J> mz:m+<CR>`z
nmap <C-K> mz:m-2<CR>`z
vmap <C-J> :m'>+<CR>`<my`>mzgv`yo`z
vmap <C-K> :m'<-2<CR>`>my`<mzgv`yo`z

" move to the prev or next buffer using ctrl+[hl]
nmap <C-H> :bprevious<CR>
nmap <C-L> :bnext<CR>

" cancel searched highlight
nmap <Leader><Space> :nohlsearch<CR>

" fzf
nmap <C-P> :Files<CR>
nmap <Leader>t :Tags<CR>
nmap <Leader>r :BTags<CR>
nmap <Leader>b :Buffers<CR>
imap <C-X><C-K> <Plug>(fzf-complete-word)
imap <C-X><C-F> <Plug>(fzf-complete-path)
imap <C-X><C-J> <Plug>(fzf-complete-file-ag)
imap <C-X><C-L> <Plug>(fzf-complete-line)

" NERDTree
nnoremap <silent> <Leader>kb :NERDTreeToggle<CR>

" tcomment
nmap <Leader>/ gcc
vmap <Leader>/ gc

" easy align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" php namespace
function! IPhpInsertUse()
  call PhpInsertUse()
  call feedkeys('a', 'n')
endfunction

function! IPhpExpandClass()
  call PhpExpandClass()
  call feedkeys('a', 'n')
endfunction

function! NPhpInsertUse()
  call PhpInsertUse()
endfunction

function! NPhpExpandClass()
  call PhpExpandClass()
endfunction

autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php inoremap <Leader>f <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>e :call NPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>f :call NPhpInsertUse()<CR>

" php cs fixer
autocmd FileType php nnoremap <leader>pf :call PhpCsFixerFixFile()<CR>

" neocomplete
" inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : '\<CR>'
" inoremap <expr><TAB> pumvisible() ? '\<C-n>' : '\<TAB>'

" =================
"  base16 theme
" =================
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace = 256
  let g:airline_theme = 'base16'

  source ~/.vimrc_background
endif
