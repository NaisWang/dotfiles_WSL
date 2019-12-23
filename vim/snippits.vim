"autocmd Filetype markdown map <leader>w yiWi[<esc>Ea](<esc>pa)
autocmd Filetype markdown inoremap ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ,w <Esc>/ <++><CR>:nohlsearch<CR>c5l<CR>
autocmd Filetype markdown inoremap ,n ---<Enter><Enter>
autocmd Filetype markdown inoremap ,b **** <++><Esc>F*hi
autocmd Filetype markdown inoremap ,s ~~~~ <++><Esc>F~hi
autocmd Filetype markdown inoremap ,i ** <++><Esc>F*i
autocmd Filetype markdown inoremap ,d `` <++><Esc>F`i
autocmd Filetype markdown inoremap ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
autocmd Filetype markdown inoremap ,m - [ ] <Enter><++><ESC>kA
autocmd Filetype markdown inoremap ,p ![](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,a [](<++>) <++><Esc>F[a
autocmd Filetype markdown inoremap ,1 #<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,2 ##<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,3 ###<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,4 ####<Space><Enter><++><Esc>kA
autocmd Filetype markdown inoremap ,l --------<Enter>

" comment shortkey
autocmd Filetype vim inoremap ;; " <Esc>8a=<Esc>"8yy2"8p$a 
autocmd Filetype sh inoremap ;; # <Esc>8a=<Esc>"8yy2"8p$a 
autocmd Filetype python inoremap ;; # <Esc>8a=<Esc>"8yy2"8p$a 
autocmd Filetype zsh inoremap ;; # <Esc>8a=<Esc>"8yy2"8p$a 
autocmd Filetype autohotkey inoremap ;; ; <Esc>8a=<Esc>"8yy2"8p$a 


autocmd Filetype python inoremap __main if __name__ == "__main__":
