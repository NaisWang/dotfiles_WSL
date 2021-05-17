let mapleader=" "
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set number
set hlsearch
set ai
set mouse=a
set termguicolors
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

noremap q ge
noremap Q q

map J 4j
map K 4k
vmap J <Nop>
vmap K <Nop>

inoremap <a-n> <c-n>

map <LEADER>f gg=G

map U <C-r>
set autochdir

noremap <LEADER><CR> :nohlsearch<CR>

set laststatus=1
set noshowcmd
set noruler

set undofile
set undodir=/root/.config/nvim/undodir/

set showtabline=0

map th  :-tabnext<CR>
map tl  :+tabnext<CR>

" split setting
map sh :set nosplitright<CR>:vsplit<CR>
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>

map <LEADER>l <C-W>l
map <LEADER>k <C-W>k
map <LEADER>j <C-W>j
map <LEADER>h <C-W>h

set autowriteall


let flag = 0
func! RotateWindow()
  if g:flag == 0
    :windo wincmd H
    let g:flag = 1
  else
    :windo wincmd K
    let g:flag = 0
  endif
endfunc
map s- :call RotateWindow()<CR>


func! GetSelectedText_y()
    normal gv"xy
    let result = getreg("x")
    return result
endfunc
vnoremap <silent> ;y   :call system('clip.exe', GetSelectedText_y())<CR>

inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>

function! RemovePairs()
    let s:line = getline(".")
    let s:previous_char = s:line[col(".")-1]

    if index(["(","[","{"],s:previous_char) != -1
        let l:original_pos = getpos(".")
        execute "normal %"
        let l:new_pos = getpos(".")
        " only right (
        if l:original_pos == l:new_pos
            execute "normal! a\<BS>"
            return
        end

        let l:line2 = getline(".")
        if len(l:line2) == col(".")
            execute "normal! v%xa"
        else
            execute "normal! v%xi"
        end
    else
        execute "normal! a\<BS>"
    end
endfunction

function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

inoremap <silent> ) <c-r>=ClosePair(')')<CR>
inoremap <silent> } <c-r>=ClosePair('}')<CR>
inoremap <silent> ] <c-r>=ClosePair(']')<CR>
