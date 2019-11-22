# ===
# === path setting
# ===
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

# ===
# === alias setting
# ===
alias np+='nohup notepad++'
alias tp='nohup Typora.ext'
alias ab='nohup Acrobat &'
alias cpd="cygpath -w $(pwd) | sed 's/\\\/\\//g' | tr -d \\\n | clip"
alias workon=". workon.sh"
alias sc="screenfetch"
alias ra="ranger"
alias image="ImageGlass_sh.sh"
alias gvim="gvim.sh"
alias rm="trash-put"

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
alias lsc="colorls"
alias llc="colorls -lA --sd"

# ===
# === fzf setting
# ===
export FZF_DEFAULT_COMMAND="fd --exclude={.git,.idea,.vscode,.sass-cache,node_modules,build} --type f"
export FZF_DEFAULT_OPTS="--layout=reverse --preview '(highlight -O ansi {} || cat {}) 2> /dev/null | head -500'"
