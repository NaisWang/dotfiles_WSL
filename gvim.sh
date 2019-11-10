#!/bin/zsh
export HOME=/mnt/c/Users/Administrator
winPath="`wslpath -m $1 | sed 's/\//\\\\/g'`"
cmd.exe /c "set SHELL=cmd.exe & start gvim.exe -p -u C:/Users/Administrator/_vimrc --remote-tab-silent $winPath"
export HOME=/root
