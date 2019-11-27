"  __  ____   __ __     _____ __  __ 
" |  \/  \ \ / / \ \   / /_ _|  \/  |
" | |\/| |\ V /   \ \ / / | || |\/| |
" | |  | | | |     \ V /  | || |  | |
" |_|  |_| |_|      \_/  |___|_|  |_|
"                                         

" ========
" ======== startup seting	
" ========
"  Auto load for first time uses
" if empty(glob('~/.config/nvim/autoload/plug.vim'))
"   silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

" autosave
set autowriteall

" let g:pydiction_location = '~/.vim/pydiction-master/complete-dict'
" let g:pydiction_menu_height = 10

" My Snippets
source ~/snippits.vim

set encoding=utf-8
set backspace=indent,eol,start " make vim can use the backspace key to delete
let mapleader=" "
set clipboard=unnamedplus

func! GetSelectedText_yy()
    normal "xY
    let result = getreg("x")
    return result
endfunc

func! GetSelectedText_y()
    normal gv"xy
    let result = getreg("x")
    return result
endfunc

func! DeleteSelectedText_d()
    normal gv"xc
    let result = getreg("x")
    return result
endfunc

func! DeleteSelectedText_dd()
    normal "xdd
    let result = getreg("x")
    return result
endfunc

func! DeleteSelectedText_diw()
    normal "xdiw
    let result = getreg("x")
    return result
endfunc

func! DeleteSelectedText_D()
    normal "xD
    let result = getreg("x")
    return result
endfunc

nnoremap <silent> ;yy  :call system('clip.exe', GetSelectedText_yy())<CR>
vnoremap <silent> ;y   :call system('clip.exe', GetSelectedText_y())<CR>
nnoremap <silent> ;yiw viw:call system('clip.exe', GetSelectedText_y())<CR>
vnoremap <silent> ;x   :call system('clip.exe', GetSelectedText_y())<CR>gvx
vnoremap <silent> ;d   :call system('clip.exe', DeleteSelectedText_d())<CR>
nnoremap <silent> ;diw viw:call system('clip.exe', DeleteSelectedText_d())<CR>
nnoremap <silent> ;dd  :call system('clip.exe', DeleteSelectedText_dd())<CR>
nnoremap <silent> ;diw :call system('clip.exe', DeleteSelectedText_diw())<CR>
nnoremap <silent> ;D   :call system('clip.exe', DeleteSelectedText_D())<CR>

nnoremap <silent> ;p :r !paste.exe<CR>i<bs><esc>l

set autochdir " automatically switch directory based on file
let &t_ut='' " make the colour matching more normal
noremap s <nop>

map U <C-r>

" set wrap
" set mouse=a " Support mouse opeartion

" Special character setting
" set list
" set listchars=tab:▸\ ,trail:▫

" make the Plugin more compatibility
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" the tab setting
set tabstop=4     " how many spaces a tab is equal to
set shiftwidth=4
set softtabstop=4
" set expandtab    "the tab is replaced by spaces 

" the search setting
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
noremap <LEADER><CR> :nohlsearch<CR>

" fold setting
set foldmethod=indent
set foldlevel=99


" undo/redo persistence
set undofile 
" Set the place of undo. You can create the undofir directory first. 
set undodir=~/.vim/undodir

map J 4j
map K 4k

" Spilling Check
map <LEADER>sc :set spell!<CR>
noremap <C-x> hea<C-x>s
inoremap <C-x> <Esc>hea<C-x>s

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>


" ========
" ======== plugin installation
" ========
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'

" theme
Plug 'morhetz/gruvbox' 
" Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-surround'

Plug 'itchyny/vim-cursorword'  " Underline the word under the cursor

Plug 'kien/rainbow_parentheses.vim'
Plug 'mhinz/vim-startify' "  The fancy start screen for Vim.
Plug 'jiangmiao/auto-pairs'
Plug 'ryanoasis/vim-devicons'
call plug#end()


" ========
" ======== GUI setting
" ========
colorscheme gruvbox
" colorscheme jellybeans
set bg=dark

set wildmenu 
set cursorline
set scrolloff=5
set relativenumber
set number
syntax on

set smartindent

" the model of cursor
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul


" ========
" ======== operation
" ========
map <LEADER>r :e $MYVIMRC<CR>
map <LEADER>R :source %<CR>

" split setting
map sh :set nosplitright<CR>:vsplit<CR>
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

map <LEADER>l <C-W>l
map <LEADER>k <C-W>k
map <LEADER>j <C-W>j
map <LEADER>h <C-W>h

" Rotate screens
map s\ <C-w>t<C-w>H
map s- <C-w>t<C-w>K

" Rotate screens
noremap sr- <C-w>b<C-w>K
noremap sr\ <C-w>b<C-w>H

" window size setting
nmap <up>    :res +5<CR>
nmap <down>  :res -5<CR>
nmap <left>  :vertical resize-5<CR>
nmap <right> :vertical resize+5<CR>

" tab setting
map tu  :tabe
map th  :-tabnext<CR>
map tl  :+tabnext<CR>
" Move the tabs with tmn and tmi
map tmh :-tabmove<CR>
map tml :+tabmove<CR>

"When you open the file, the cursor will stay where the file was last opened. 
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" Buffer setting
nmap bl  :bnext<CR>
nmap bh  :bprev<CR>
nmap bc  :bdelete <CR>
 
" Press space and to jump to the next and edit it
nnoremap ;; a<++><Esc>/<++><CR>
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>"_c4l
:match StatusLineTermNC /<++>/

" the setting about deleting
noremap  <leader>x  "_x
nnoremap <leader>dd "_dd
nnoremap <leader>d  "_d
vnoremap <leader>d  "_d
nnoremap <leader>D  "_D


" ========
" ======== NERDTree
" ========
map tt :NERDTreeToggle<CR>
map tn :NERDTreeFind<CR>
let NERDTreeMapOpenInTab = "o"
let NERDTreeShowBookmarks=1 
" let Nerd Christmas Tree=1   "Make the NERD Tree more bi
let NERDTreeIgnore = [
            \ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '\.svn$', '\.swp$',
            \ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.ropeproject$',
            \ ]


" ========
" ======== rainbow-parentheses-vim
" ========
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces



" ========
" ======== Vim-Easy-Align
" ========
nmap <LEADER>a <Plug>(EasyAlign)
vmap <LEADER>a <Plug>(EasyAlign)


" ========
" ======== vim-commentary
" ========
autocmd FileType python,shell,coffee set commentstring=#\ %s
autocmd FileType java,c,cpp set commentstring=//\ %s


" ========
" ======== vim-airline
" ========
let g:airline_powerline_fonts=1
let g:airline_theme = 'bubblegum'
let g:airline#extensions#tabline#enabled = 1
function! ArilineInit()
    let g:airline_section_a = airline#section#create(['mode', ' ', 'branch'])
    let g:airline_section_b = airline#section#create_left(['ffenc', 'hunks', '%F'])
    "let g:airline_section_c = airline#section#create(['filetype'])
    let g:airline_section_x = airline#section#create(['%P'])
    let g:airline_section_y = airline#section#create(['%B'])
    let g:airline_section_z = airline#section#create_right(['%l', '%c'])
endfunction
autocmd VimEnter * call ArilineInit()


" ========
" ======== fzf.vim
" ========
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
" nnoremap <silent> <Leader>p :Lines<CR>
nnoremap <silent> <Leader>o :History<CR>
command! -bang -nargs=* Ag
   \ call fzf#vim#ag(<q-args>,
   \                 <bang>0 ? fzf#vim#with_preview('up:60%')
   \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
   \                 <bang>0)
nnoremap <silent> <Leader>A :Ag<CR>


" ========
" ======== neocomplete
" ========
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
