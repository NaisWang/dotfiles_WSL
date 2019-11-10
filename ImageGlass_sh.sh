if [ -z "$1" ];then
	echo "ERROE: the file path is empty"
	exit;
fi
winPath="`wslpath -m $1 | sed 's/\//\\\\/g'`"
cmd.exe /c "set SHELL=cmd & start ImageGlass.exe $winPath"
