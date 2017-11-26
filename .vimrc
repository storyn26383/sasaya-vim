" =================
"  vim-plug
" =================

call plug#begin('~/.vim/plugged')

" Plgins
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
" Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'storyn26383/vim-autoclose'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'ervandew/supertab'

Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'

Plug 'StanAngeloff/php.vim'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }

Plug 'digitaltoad/vim-pug'
" Plug 'tpope/vim-haml'
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
Plug 'mileszs/ack.vim'

" Plug 'm2mdas/phpcomplete-extended'
" Plug 'm2mdas/phpcomplete-extended-laravel'
" Plug 'Shougo/vimproc.vim'
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
" Plug 'Valloric/YouCompleteMe'

call plug#end()

" =================
"  settings
" =================

set nocompatible                      " not compatible with the old-fashion vi mode
set backspace=2                       " allow backspacing over everything in insert nc >kkmode
set history=1000                      " keep 1000 lines of command line history
set undolevels=100
set ruler                             " show the cursor position all the time
set autoread                          " auto read when file is changed from outside
set wrap
set linebreak
set nolist
set hidden
set cursorline
set showmatch
set foldenable
set number
set numberwidth=4
" set relativenumber
set title
set showcmd
set noshowmode
set nobomb                            " no BOM(Byte Order Mark)
set nostartofline
set laststatus=2
set clipboard+=unnamed
set splitright                        " always open vertical split window in the right side
set splitbelow                        " always open horizontal split window below
set scrolloff=4                       " start scrolling when n lines away from margins
set switchbuf=useopen
set showtabline=2                     " always show tab
set wildmode=longest,list             " use emacs-style tab completion when selecting files, etc
set wildmenu                          " make tab completion for files/buffers act like bash
set key=                              " disable encryption
set synmaxcol=256
set viminfo=                          " disable .viminfo file
set completeopt=menuone
set ttyfast                           " send more chars while redrawing
set lazyredraw                        " speedup vim
set timeoutlen=1000
set ttimeoutlen=0

set foldmethod=indent
set foldlevel=100

set hlsearch                          " search highlighting
set incsearch                         " incremental search
set t_Co=256
set guifont=Source\ Code\ Pro:h15     " only available for the GUI version
set linespace=3                       " only available for the GUI version
set guioptions-=l                     " remove gui scrollbar
set guioptions-=L
set guioptions-=r
set guioptions-=R

set nobackup                          " no *~ backup files
set noswapfile
set nowritebackup
set copyindent                        " copy the previous indentation on autoindenting
set ignorecase                        " ignore case when searching
set smartcase
set smarttab                          " insert tabs on the start of a line according to
set expandtab                         " replace <TAB> with spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2
set shortmess=Ia                      " remove splash wording

" disable sound on errors
set visualbell
set noerrorbells
set t_vb=
set tm=500

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
let base16colorspace=256
colorscheme base16-tomorrow-night
" source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim

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
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP

" todo file
command! Todo :e ~/Documents/todo.md

" =================
"  plugin settings
" =================

" ctrlp
let g:ctrlp_custom_ignore={
  \ 'dir':  '\(\.git|\.hg|\.svn\|node_modules\|bower_components\|vendor\)$',
  \ 'file': '\.DS_Store$',
  \ 'binary file': '\.(exe|so|dll)$',
  \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
let g:ctrlp_show_hidden=1

" airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#tabline#buffer_nr_format='%s: '
let g:airline_theme='base16'

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeChDirMode=2
let NERDTreeMouseMode=2
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=0
let NERDTreeIgnore=['\.git$', '\.DS_Store$']
let g:NERDTreeWinSize=30
let g:nerdtree_tabs_focus_on_files=1
let g:nerdtree_tabs_open_on_gui_startup=0

" indentLine
" let g:indentLine_enabled=1
" let g:indentLine_faster=1
" let g:indentLine_char='┆'
" let g:indentLine_first_char='┆'
" let g:indentLine_color_term=239
" let g:indentLine_showFirstIndentLevel=1

" php cs fixer
let g:php_cs_fixer_level='psr2'
let g:php_cs_fixer_enable_default_mapping=0

" syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=0
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=1
let g:syntastic_aggregate_errors=1
let g:syntastic_php_checkers=['php', 'phpcs']
let g:syntastic_php_phpcs_args='--standard=psr2'

" supertab
let g:SuperTabCrMapping=1
" let g:SuperTabDefaultCompletionType='<C-X><C-O>'
" let g:SuperTabContextDefaultCompletionType='<C-X><C-O>'

" tcomment
call tcomment#DefineType('pug', '//- %s')

" php namespace
let g:php_namespace_sort="'{,'}-1!awk '{print length, $0}' | sort -n | cut -d' ' -f2-"
let g:php_namespace_sort_after_insert=1

" php complete
" let g:phpcomplete_index_composer_command='composer'

" neocomplete
" let g:neocomplete#enable_at_startup=1
" let g:neocomplete#enable_smart_case=1
" let g:neocomplete#lock_buffer_name_pattern='\*ku\*'
" let g:neocomplete#sources#syntax#min_keyword_length=3
" if !exists('g:neocomplete#keyword_patterns')
"   let g:neocomplete#keyword_patterns={}
" endif
" let g:neocomplete#keyword_patterns['default']='\h\w*'
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns={}
" endif
" let g:neocomplete#sources#omni#input_patterns.php='[^. \t]->\h\w*\|\h\w*::'

" emmet
let g:user_emmet_leader_key=','

" vue
let g:tcommentGuessFileType_vue = 'pug'
let g:user_emmet_settings = { 'vue': { 'extends': 'css' } }

" ack.vim
if executable('ag')
  let g:ackprg = 'ag --ignore "*.lock" --vimgrep'
endif

" =================
"  key remap
" =================

" leader key
let mapleader=','
let g:mapleader=','

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
nmap <TAB> v>
nmap <S-TAB> v<
vmap <TAB> >gv
vmap <S-TAB> <gv

" move lines up and down using ctrl+[jk]
nmap <C-j> mz:m+<CR>`z
nmap <C-k> mz:m-2<CR>`z
vmap <C-j> :m'>+<CR>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<CR>`>my`<mzgv`yo`z

" move to the prev or next buffer using ctrl+[hl]
nmap <C-h> :bprevious<CR>
nmap <C-l> :bnext<CR>

" cancel searched highlight
noremap <Leader><Space> :nohlsearch<CR>

" ctrlp
nnoremap <silent> <Leader>t :CtrlPTag<CR>
nnoremap <silent> <Leader>r :CtrlPBufTag<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>

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
