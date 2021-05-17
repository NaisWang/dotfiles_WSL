vscode=/mnt/c/Users/whz11/AppData/Local/Programs/"Microsoft VS Code"
potplay=/mnt/l/PotPlayer
ksolaunch=/mnt/c/Users/whz11/AppData/Local/Kingsoft/"WPS Office"
node=/home/naiswang/node-v14.16.0-linux-x64/bin

alias gc="/mnt/c"
alias gm="/mnt/m"
alias gl="/mnt/l"
alias tail="tail ---disable-inotify"

export JAVA_HOME=/home/naiswang/jdk-11.0.9.1+1/
export JER_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib

export PATH=${node}:$PATH:${vscode}:${potplay}:${JAVA_HOME}/bin:${ksolaunch}
