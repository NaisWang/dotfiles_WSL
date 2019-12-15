# ========
# ======== path setting
# ========
Acrobat=/mnt/c/"Program Files (x86)"/Adobe/"Acrobat DC"/Acrobat
notepad=/mnt/e/notepad++
typora=/mnt/e/typora/Typora
Office=/mnt/c/"Program Files"/"Microsoft Office"/root/Office16
potplay=/mnt/e//PotPlayer
quickLook=/mnt/c/"Program Files"/WindowsApps/21090PaddyXu.QuickLook_3.6.5.0_neutral__egxr34yet59cg/Package
fd=/mnt/c/Users/Administrator/scoop/apps/fd/7.3.0
code=/mnt/e/vscode/"Microsoft VS Code"
zip7=/mnt/e/7zip/7-Zip
chrome=/mnt/c/"Program Files (x86)"/Google/Chrome/Application
gvim=/mnt/e/gvim/
ImageGlass=/mnt/e/ImageGlass/ImageGlass/
xmind=/mnt/c/"Program Files"/"XMind ZEN"
export PATH=/bin:$PATH:${Acrobat}:${notepad}:${typora}:${Office}:${potplay}:${quickLook}:${zip7}:${fd}:${chrome}:${gvim}:${ImageGlass}:${code}:${xmind}

# ========
# ======== alias setting
# ========
alias gje="cd /mnt/f/javaEE_project"
alias gjs="cd /mnt/f/javaSE_project"
alias gjt="cd /mnt/f/javaTools"
alias gpp="cd /mnt/f/python_project"
alias gwp="cd /mnt/f/Web_project"
alias gwt="cd /mnt/f/WebTools"
alias gh="cd ~"
alias gwh="cd /mnt/c/Users/Administrator"
alias gc="cd /mnt/c"
alias gf="cd /mnt/f"
alias ge="cd /mnt/e"
alias gdt="cd /mnt/c/Users/Administrator/Desktop"
alias grg="cd ~/.config/ranger"
alias gsm="cd /mnt/f/study-materials"
alias gc+="cd /mnt/f/c++_project"
alias gmp="cd /mnt/f/temporary"
alias gbd="cd /mnt/f/BaiduNetdiskDownload"
alias gvn="cd /mnt/f/vnote"
alias gvi="cd /mnt/f/envs"
alias gle="cd /mnt/c/Users/Administrator/.leetcode"

alias ab='nohup Acrobat &'
alias workon=". workon.sh"
alias sc="screenfetch"
alias ra="ranger"
alias image="ImageGlass_sh.sh"
alias gvim="gvim.sh"
alias rm="trash-put"

alias lsc="colorls"
alias llc="colorls -lA --sd"

alias code="code.sh"

alias killz="python3 /mnt/f/dotfiles/dotfiles_WSL/killzsh.py"

alias t="tmux"
alias ta="tmux a"

alias ps="powershell.exe"

alias to="tb"
alias tot="tb -t"
alias toc="tb -c"
alias tod="tb -d"
alias toC="tb --clear"

# ========
# ======== fzf setting
# ========
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
export FZF_DEFAULT_OPTS="--layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
