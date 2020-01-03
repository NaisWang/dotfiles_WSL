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
tmux=~/tmux-master
export PATH=/bin:$PATH:${tmux}:${Acrobat}:${notepad}:${typora}:${Office}:${potplay}:${quickLook}:${zip7}:${fd}:${chrome}:${gvim}:${ImageGlass}:${code}:${xmind}

export JAVA_HOME=/usr/local/share/jdk/jdk1.8.0_231
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=$JAVA_HOME/lib/dt.jr:$JAVA_HOME/lib/tools.jar

# ========
# ======== the alias of path 
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
alias gvi="cd /mnt/f/envs"
alias gle="cd /mnt/c/Users/Administrator/.leetcode"
alias gvn="cd /mnt/f/blog/blogGitee/source/_posts"
alias yd="pwd |clip.exe"
alias yD="wslpath -m $(pwd) | tr -d \\n |clip.exe"

# ========
# ======== linux software
# ========
alias ra="ranger"
alias sc="screenfetch"
alias rm="trash-put"

# tmux
alias t="tmux"
alias ta="tmux a"

# taskbook
alias to="tb"
alias tot="tb -t"
alias toc="tb -c"
alias tod="tb -d"
alias toC="tb --clear"

# nvim
alias vim="nvim"

# colorls
alias lsc="colorls"
alias llc="colorls -lA --sd"

# python3
alias py="python3"
alias ipy="ipython3"

alias killz="python3 /mnt/f/dotfiles/dotfiles_WSL/killzsh.py"

# ========
# ======== widows software
# ========
alias ab='nohup Acrobat &'
alias workon=". workon.sh"
alias image="ImageGlass_sh.sh"
alias gvim="gvim.sh"
alias code="code.sh"
alias ps="powershell.exe"
alias re="explorer.exe . &"
