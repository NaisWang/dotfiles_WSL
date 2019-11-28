# prevnet opening the code.exe with WSL remote way in WSL terminal
winPath="`wslpath -m $1 | sed 's/\//\\\\/g'`"
cmd.exe /c "set SHELL=cmd.exe & code $winPath"
