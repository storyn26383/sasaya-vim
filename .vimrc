" =================
"  Vundle
" =================

" set the runtime path to include Vundle and initialize
filetype off                         " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plgins
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
" Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-surround'
Plugin 'tomtom/tcomment_vim'
Plugin 'Townk/vim-autoclose'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'junegunn/vim-easy-align'
Plugin 'ervandew/supertab'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'

Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'shawncplus/phpcomplete.vim'

Plugin 'digitaltoad/vim-pug'
" Plugin 'tpope/vim-haml'
" Plugin 'jwalton512/vim-blade'

Plugin 'pangloss/vim-javascript'
" Plugin 'posva/vim-vue'
" Plugin 'kchmck/vim-coffee-script'

Plugin 'ap/vim-css-color'
Plugin 'mattn/emmet-vim'

Plugin 'scrooloose/syntastic'

Plugin 'airblade/vim-gitgutter'

" Plugin 'm2mdas/phpcomplete-extended'
" Plugin 'm2mdas/phpcomplete-extended-laravel'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'Shougo/unite.vim'
" Plugin 'Shougo/neocomplete.vim'
" Plugin 'Shougo/neosnippet.vim'
" Plugin 'Shougo/neosnippet-snippets'
" Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()                    " required
filetype plugin indent on            " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


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
syntax on                             " syntax highlight
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
    call system('ctags -a "' . file . '"')
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
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\.DS_Store$',
  \ 'binary file': '\v\.(exe|so|dll)$',
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

" =================
"  key remap
" =================

" leader key
let mapleader=','
let g:mapleader=','

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
nmap <Leader>c :!ctags &<CR>

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
nmap g] g<C-]>
nmap g[ <C-O>

" force myself to not to use the error keys
" map <UP> <NOP>
" map <DOWN> <NOP>
" map <LEFT> <NOP>
" map <RIGHT> <NOP>
" inoremap <UP> <NOP>
" inoremap <DOWN> <NOP>
" inoremap <LEFT> <NOP>
" inoremap <RIGHT> <NOP>

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
function! SortUseWithLength()
  silent execute "normal! mzgg/namespace\<CR>/use \<CR>V/class\\|trait\\|interface\<CR>?use \<CR>:!awk '{ print length, $0 }' | sort -n | cut -d' ' -f2-\<CR>`z"
endfunction

function! IPhpInsertUse()
  call PhpInsertUse()
  call SortUseWithLength()
  call feedkeys('a', 'n')
endfunction

function! IPhpExpandClass()
  call PhpExpandClass()
  call feedkeys('a', 'n')
endfunction

function! NPhpInsertUse()
  call PhpInsertUse()
  call SortUseWithLength()
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
