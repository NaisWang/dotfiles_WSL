#!/bin/bash
HOME=/mnt/c/Users/Administrator
winPath="`wslpath -m $1 | sed 's/\//\\\\/g'`"
cmd.exe /c "set SHELL=cmd.exe & start gvim.exe -p --remote-tab-silent $winPath"
HOME=/root
