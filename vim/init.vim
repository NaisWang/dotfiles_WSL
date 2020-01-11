"  __  ____   __  _   _ _____ _____     _____ __  __
" |  \/  \ \ / / | \ | | ____/ _ \ \   / /_ _|  \/  |
" | |\/| |\ V /  |  \| |  _|| | | \ \ / / | || |\/| |
" | |  | | | |   | |\  | |__| |_| |\ V /  | || |  | |
" |_|  |_| |_|   |_| \_|_____\___/  \_/  |___|_|  |_|

" ========
" ======== startup seting
" ========
" Auto load for first time uses
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

" autosave
set autowriteall

" My Snippets
source ~/snippits.vim

" terminal set
set showcmd
" Any key can pressed to end the terminal
autocmd TermOpen term://* startinsert

set encoding=utf-8
let mapleader=" "
set clipboard=unnamedplus

nnoremap <C-a> ggVG

" \p to show the current buffer file path
nnoremap \p 1<C-G>

noremap B b

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

" copy and deleting without line break
nnoremap 'd v$hd
nnoremap 'y v$hy

set autochdir " automatically switch directory based on file
noremap s <nop>

map U <C-r>

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" uppercase and lowercase
noremap gu gU
noremap gU gu

" make the Plugin more compatibility
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" the tab setting
" how many spaces a tab is equal to
set tabstop=2
set shiftwidth=2
set softtabstop=2
"the tab is replaced by spaces
set expandtab

" the search setting
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
" if have a capital letter, switch to a case-sensitive search
set smartcase
noremap <LEADER><CR> :nohlsearch<CR>

" fold setting
set foldmethod=indent
set foldlevel=99

" delete the all marks in all buffers and refresh the file
noremap m; :delmarks!<CR>:e<CR>
" undo/redo persistence
set undofile
" " Set the place of undo. You can create the undofir directory first.
set undodir=~/.vim/undodir

map J 4j
map K 4k

noremap , ;

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" ========
" ======== plugin installation
" ========
call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'kshenoy/vim-signature'
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins', 'for' :['python', 'vim-plug'] }
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'Chiel92/vim-autoformat'
Plug 'itchyny/vim-cursorword'  " Underline the word under the cursor
Plug 'kien/rainbow_parentheses.vim'
Plug 'mhinz/vim-startify' "  The fancy start screen for Vim.
Plug 'jiangmiao/auto-pairs'
Plug 'iamcco/markdown-preview.vim'
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'mbbill/undotree'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-bufferline'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'liuchengxu/vista.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim' " For ranger.vim
call plug#end()

" ========
" ======== GUI setting
" ========
colorscheme gruvbox
set bg=dark
let g:gruvbox_contrast_dark="hard"
set guifont=SauceCodePro\ NF:h10

set laststatus=0

set wildmenu
set cursorline
set scrolloff=5
set relativenumber
set number
syntax on

set smartindent

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
map tc  :q<CR>
map th  :-tabnext<CR>
map tl  :+tabnext<CR>
" Move the tabs with tmn and tmi
map tmh :-tabmove<CR>
map tml :+tabmove<CR>
map t1  1gt
map t2  2gt
map t3  3gt
map t4  4gt
map t5  5gt

" Switch to last-active tab
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap tt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Buffer setting
nmap bl  :bnext<CR>
nmap bh  :bprev<CR>
nmap bc  :bdelete <CR>
nmap bb  <C-^>

" open a new tab for each open buffer
nmap bt  :tab sball<CR>

"When you open the file, the cursor will stay where the file was last opened.
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Press space and to jump to the next and edit it
nnoremap ;; a<++><Esc>/<++><CR>
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>"_c4l
:match WildMenu /<++>/

" the setting about deleting
noremap  <leader>x  "_x
nnoremap <leader>dd "_dd
nnoremap <leader>d  "_d
vnoremap <leader>d  "_d
nnoremap <leader>D  "_D

" find and replace
noremap \s :%s//g<left><left>


" Compile function
noremap <leader>c :call CompileRunGcc()<CR>

func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ -std=c++11 % -Wall -o %<"
    exec "!time ./%<"
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 % || echo ==================== window ====================  && python.exe %
  elseif &filetype == 'html'
    silent! exec "!chrome.exe % &"
  elseif &filetype == 'java'
    exec "!javac.exe %"
    exec "!time java.exe %<"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  endif
endfunc


map <LEADER>s :call StopRun()<CR>
fun! StopRun()
  exec "w"
  if &filetype == 'markdown'
    exec "MarkdownPreviewStop"
  endif
endfunc

" ========
" ======== easymotion
" ========
nmap ss <Plug>(easymotion-s2)

" ========
" ======== NERDTree
" ========
noremap <M-p> :NERDTreeToggle<CR>
nn <silent>tn :exec("NERDTree ".expand('%:h'))<CR>
let NERDTreeMapOpenInTab='t'
let NERDTreeIgnore = [
      \ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '\.svn$', '\.swp$',
      \ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.ropeproject$',
      \ ]
let NERDTreeMapToggleHidden = "zh"

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
" ======== indentLine
" ========
autocmd FileType json,markdown let g:indentLine_conceallevel=0
autocmd FileType javascript,python,c,cpp,java,vim,shell let g:indentLine_conceallevel=2

" ========
" ======== fzf.vim
" ========
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
" nnoremap <silent> <Leader>p :Lines<CR>
nnoremap <silent> <Leader>o :History<CR>
nnoremap <silent> <Leader>m :Marks<CR>

command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)
nnoremap <silent> <Leader>A :Ag<CR>


" ========
" ======== format
" ========
nnoremap \f :Autoformat<CR>

" ===
" === MarkdownPreview
" ===
let g:mkdp_path_to_chrome = "chrome.exe"
let g:mkdp_auto_start = 0
let g:mkdp_refresh_slow = 1
let g:mkdp_auto_close = 0
let g:vim_markdown_conceal=0

" ===
" === vim-table-mode
" ===
noremap <LEADER>tm :TableModeToggle<CR>
"let g:table_mode_disable_mappings = 1
let g:table_mode_cell_text_object_i_map = 'k<Bar>'

" ========
" ========  auto-pairs
" ========
let g:AutoPairsShortcutToggle = ''

" ========
" ======== coc
" ========
set hidden
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore', 'coc-vimlsp', 'coc-tailwindcss', 'coc-stylelint', 'coc-emmet']

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" Useful commands
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <M-'> :CocList diagnostics<CR>

set shortmess+=c
set updatetime=300
" always show signcolumns
set signcolumn=yes

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nnoremap <silent> <c-p> :call <SID>show_documentation()<CR>

" ========
" ======== vim-signature
" ========
let g:SignatureMap = {
      \ 'Leader':"m",
      \ 'PlaceNextMark':"m,",
      \ 'ToggleMarkAtLine':"m.",
      \ 'PurgeMarksAtLine':"dm",
      \ 'DeleteMark':"",
      \ 'PurgeMarks':"",
      \ 'PurgeMarkers':"",
      \ 'GotoNextLineAlpha':"m<LEADER>",
      \ 'GotoPrevLineAlpha':"",
      \ 'GotoNextSpotAlpha':"m<LEADER>",
      \ 'GotoPrevSpotAlpha':"",
      \ 'GotoNextLineByPos':"",
      \ 'GotoPrevLineByPos':"",
      \ 'GotoNextSpotByPos':"",
      \ 'GotoPrevSpotByPos':"",
      \ 'GotoNextMarker':"",
      \ 'GotoPrevMarker':"",
      \ 'GotoNextMarkerAny':"",
      \ 'GotoPrevMarkerAny':"",
      \ 'ListLocalMarks':"m/",
      \ 'ListLocalMarkers':"m?"
      \ }

" ========
" ======== Undotree
" ========
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
  nmap <buffer> l <plug>UndotreeNextState
  nmap <buffer> h <plug>UndotreePreviousState
  nmap <buffer> L 5<plug>UndotreeNextState
  nmap <buffer> H 5<plug>UndotreePreviousState
endfunc


" ========
" ======== GitGutter
" ========
let g:gitgutter_map_keys = 0
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_preview_win_floating = 1
autocmd BufWritePost * GitGutter
nnoremap <LEADER>gf :GitGutterFold<CR>
nnoremap H :GitGutterPreviewHunk<CR>
nnoremap <LEADER>g- :GitGutterPrevHunk<CR>
nnoremap <LEADER>g= :GitGutterNextHunk<CR>

" ========
" ======== Ultisnips
" ========
inoremap <c-n> <nop>
let g:UltiSnipsExpandTrigger="<a-m>"
let g:UltiSnipsJumpForwardTrigger="<a-m>"
let g:UltiSnipsJumpBackwardTrigger="<a-n>"
let g:UltiSnipsSnippetDirectories = ['/mnt/f/dotfiles/dotfiles_WSL/vim/Ultisnips']


" ========
" ======== Vista.vim
" ========
noremap <silent> T :Vista!!<CR>
noremap <silent> <C-t> :Vista finder<CR>

" ========
" ======== Ranger.vim
" ========
nnoremap R :Ranger<CR>
let g:ranger_map_keys = 0
