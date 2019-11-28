winPath="`wslpath -m $1 | sed 's/\//\\\\/g'`"
cmd.exe /c "set SHELL=cmd.exe & code $winPath"
