"  __  ____   __ __     _____ __  __ 
" |  \/  \ \ / / \ \   / /_ _|  \/  |
" | |\/| |\ V /   \ \ / / | || |\/| |
" | |  | | | |     \ V /  | || |  | |
" |_|  |_| |_|      \_/  |___|_|  |_|
"                                         

" =========================="
"		startup seting		"
" =========================="
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
" source ~/snippits.vim

set encoding=utf-8
set backspace=indent,eol,start "使vi可以用退格键删除,默认不能删旧的.
                               "indent是指可以删除字段缩进,eol是可以通过退格键合并两行,
                               "start则是可以删除插入前的输入(bs)
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
    normal gv"xd
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

nnoremap <silent> ;yy :call system('clip.exe', GetSelectedText_yy())<CR>
vnoremap <silent> ;y :call system('clip.exe', GetSelectedText_y())<CR>
vnoremap <silent> ;x :call system('clip.exe', GetSelectedText_y())<CR>gvx
vnoremap <silent> ;d :call system('clip.exe', DeleteSelectedText_d())<CR>
nnoremap <silent> ;dd :call system('clip.exe', DeleteSelectedText_dd())<CR>
nnoremap <silent> ;diw :call system('clip.exe', DeleteSelectedText_diw())<CR>
nnoremap <silent> ;D :call system('clip.exe', DeleteSelectedText_D())<CR>

nnoremap <silent> ;p :r !paste.exe<CR>i<bs><esc>l


set autochdir " 根据文件自动切换目录
let &t_ut='' " 使配色更加正常
noremap s <nop>
" set wrap
" set mouse=a " Support mouse opeartion

" Special character setting
" set list
" set listchars=tab:▸\ ,trail:▫

set langmenu=zh_CN.UTF-8          "设置菜单语言
source $VIMRUNTIME/delmenu.vim    "导入删除菜单脚本，删除乱码的菜单
source $VIMRUNTIME/menu.vim       "导入正常的菜单脚本
" language messages zh_CN.utf-8     "设置提示信息语言

" make the Plugin more compatibility
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

" the tab setting
set tabstop=4     " 一个tab等于多少空格(ts)
set shiftwidth=4  " 自动缩进时缩进为4格(sw)
set softtabstop=4
"set expandtab    " 编辑时可以将tab替换为空格(et)

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

" https://superuser.com/questions/302186/vim-scrolls-very-slowly-when-a-line-is-too-long
" Syntax coloring lines that are too long just slows down the world
set synmaxcol=1000
set ttyfast    " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems

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

" Compile function
map <LEADER>c :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitright
    ":vsp
    ":vertical resize-10
    :sp
    :term python3 %
  elseif &filetype == 'html'
    exec "!chromium % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  endif
endfunc

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" =========================="
"		plugin installation	"
" =========================="
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'

" theme
Plug 'morhetz/gruvbox' 
" Plug 'nanotech/jellybeans.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'kshenoy/vim-signature'
Plug 'mbbill/undotree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-surround'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'tacahiroy/ctrlp-funky'
Plug 'kien/rainbow_parentheses.vim'
" Plug 'ycm-core/YouCompleteMe'
Plug 'itchyny/vim-cursorword'  " Underline the word under the cursor
Plug 'mhinz/vim-startify' "  The fancy start screen for Vim.
Plug 'jiangmiao/auto-pairs'
" Plug 'ryanoasis/vim-devicons'
" Plug 'w0rp/ale'

" Git
" Plug 'tpope/vim-fugitive'
" Plug 'mhinz/vim-signify'
" Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'mattn/emmet-vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'dkarter/bullets.vim', { 'for' :['markdown', 'vim-plug'] }
call plug#end()


" =========================="
"		GUI setting			"
" =========================="
colorscheme gruvbox
" colorscheme jellybeans
set bg=dark                       
set guioptions=                   " Get rid of the scrollbar on both sides 
set guifont=Source\ Code\ Pro:h10

set wildmenu 
set cursorline
set scrolloff=5
set relativenumber
set number
syntax on

set smartindent

" auto-completion
" inoremap ' ''<ESC>i
" inoremap " ""<ESC>i
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap { {<CR>}<ESC>O

" the model of cursor
:autocmd InsertEnter * set cul
:autocmd InsertLeave * set nocul


" =========================="
"		operation			"
" =========================="
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
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l
:match StatusLineTermNC /<++>/

" the setting about deleting
noremap  <leader>x  "_x
nnoremap <leader>dd "_dd
nnoremap <leader>d  "_d
vnoremap <leader>d  "_d
nnoremap <leader>D  "_D


"======================================="
"           plugin setting              "
"======================================="
" =========================="
"		NERDTree			"
" =========================="
map tt :NERDTreeToggle<CR>
map tn :NERDTreeFind<CR>
let NERDTreeMapOpenInTab = "o"
let NERDTreeShowBookmarks=1 
" let Nerd Christmas Tree=1   "Make the NERD Tree more bi
let NERDTreeIgnore = [
            \ '\.git$', '\.hg$', '\.svn$', '\.stversions$', '\.pyc$', '\.pyo$', '\.svn$', '\.swp$',
            \ '\.DS_Store$', '\.sass-cache$', '__pycache__$', '\.egg-info$', '\.ropeproject$',
            \ ]


" =========================="
"	nerdtree-git-plugin		"
" =========================="
" let g:NERDTreeShowIgnoredStatus = 1
" let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" =========================="
"			ale				"
" =========================="
"let g:ale_sign_column_always = 1 
"let g:ale_set_highlights = 0
""自定义error和warning图标
"let g:ale_sign_error = '✗'
"let g:ale_sign_warning = '⚡'
""在vim自带的状态栏中整合ale
"let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
""显示Linter名称,出错或警告等相关信息
"let g:ale_echo_msg_error_str = 'E'
"let g:ale_echo_msg_warning_str = 'W'
"let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
""打开文件时不进行检查
"let g:ale_lint_on_enter = 0
""普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
"nmap , <Plug>(ale_previous_wrap)
"nmap . <Plug>(ale_next_wrap)
""<Leader>s触发/关闭语法检查
"nmap <Leader>s :ALEToggle<CR>
""<Leader>d查看错误或警告的详细信息
"nmap <Leader>d :ALEDetail<CR>
""使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
"let g:ale_linters = {
"\   'c++': ['clang'],
"\   'c': ['clang'],
"\   'python': ['pylint'],
"\}

" }}}
" =========================="
"	rainbow-parentheses-vim	"
" =========================="
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

" 不加入这行, 防止黑色括号出现, 很难识别
" \ ['black',       'SeaGreen3'],

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


" =========================="
"		vim-signiture		"
" =========================="
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "dm-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "dm/",
        \ 'PurgeMarkers'       :  "dm?",
        \ 'GotoNextLineAlpha'  :  "m<LEADER>",
        \ 'GotoPrevLineAlpha'  :  "",
        \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
        \ 'GotoPrevSpotAlpha'  :  "",
        \ 'GotoNextLineByPos'  :  "",
        \ 'GotoPrevLineByPos'  :  "",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "",
        \ 'GotoPrevMarker'     :  "",
        \ 'GotoNextMarkerAny'  :  "",
        \ 'GotoPrevMarkerAny'  :  "",
        \ 'ListLocalMarks'     :  "m/",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


" =========================="
"		MarkdownPreview		"
" =========================="
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'


" =========================="
"      vim-table-mode       "
" =========================="
map <LEADER>tm :TableModeToggle<CR>


" =========================="
"		Undotree            "
" =========================="
let g:undotree_DiffAutoOpen = 1
map L :UndotreeToggle<CR>


" =========================="
"		TagbarToggle		"
" =========================="
nmap <M-o> :TagbarToggle<CR>


" =========================="
"		Vim-Easy-Align		"
" =========================="
nmap <LEADER>a <Plug>(EasyAlign)
vmap <LEADER>a <Plug>(EasyAlign)


" =========================="
"		vim-commentary		"
" =========================="
autocmd FileType python,shell,coffee set commentstring=#\ %s
autocmd FileType java,c,cpp set commentstring=//\ %s


" =========================="
"		vim-airline 		"	
" =========================="
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


" =========================="
"		fzf.vim				"
" =========================="
"<Leader>f在当前目录搜索文件
nnoremap <silent> <Leader>f :Files<CR>
"<Leader>b切换Buffer中的文件
nnoremap <silent> <Leader>b :Buffers<CR>
"<Leader>p在当前所有加载的Buffer中搜索包含目标词的所有行，:BLines只在当前Buffer中搜索
" nnoremap <silent> <Leader>p :Lines<CR>
"<Leader>h在Vim打开的历史文件中搜索，相当于是在MRU中搜索，:History：命令历史查找
nnoremap <silent> <Leader>o :History<CR>
command! -bang -nargs=* Ag
   \ call fzf#vim#ag(<q-args>,
   \                 <bang>0 ? fzf#vim#with_preview('up:60%')
   \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
   \                 <bang>0)
nnoremap <silent> <Leader>A :Ag<CR>


" =========================="
"		neocomplete		    "
"==========================="
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


" =========================="
"		ctrlP				"
"==========================="
" let g:ctrlp_map = '<leader>p'
" let g:ctrlp_cmd = 'CtrlP'
" 查看最近打开的文件
" map <leader>f :CtrlPMRU<CR>
" <Leader>b显示缓冲区文件，并可通过序号进行跳转
" nmap <Leader>b :CtrlPBuffer<CR>
" let g:ctrlp_custom_ignore = {
"     \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
"     \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
"     \ }
" let g:ctrlp_working_path_mode=0
" let g:ctrlp_match_window_bottom=1
" let g:ctrlp_max_height=15
" let g:ctrlp_match_window_reversed=0
" let g:ctrlp_mruf_max=500
" let g:ctrlp_follow_symlinks=1
" 调用ag进行搜索提升速度，同时不使用缓存文件
 " if executable('ag')
 "   set grepprg=ag\ --nogroup\ --nocolor
 "   let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
 "   let g:ctrlp_use_caching = 0
 " endif


" =========================="
"		ctrlp-funky			"
"==========================="
" 进入当前文件的函数列表搜索
" nnoremap <Leader>fu :CtrlPFunky<Cr> 
" 搜索当前光标下单词对应的函数
" nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
" let g:ctrlp_funky_syntax_highlight = 1
" let g:ctrlp_extensions = ['funky']
