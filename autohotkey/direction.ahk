; __  ____   __     _    _   _ _  __
;|  \/  \ \ / /    / \  | | | | |/ /
;| |\/| |\ V /    / _ \ | |_| | ' / 
;| |  | | | |    / ___ \|  _  | . \ 
;|_|  |_| |_|   /_/   \_\_| |_|_|\_\
;                                   
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

init()
gvimInit()

global windows :={}
; The values has tow values-10,20,11,21
; 10: left and not mir
; 20: right and not mir
; 11: left and mir
; 21: right and mir

global lastX :={}
global lastY :={}
global lastW :={}
global lastH :={}

global specialPro := {"WINWORD.EXE": 1,"Code.exe": 1,"ONENOTE.EXE": 1,"EXCEL.EXE": 1,"OUTLOOK.EXE": 1,"wps.exe": 1,"PotPlayerMini64.exe": 1,"Typora.exe": 1, "XMind\ ZEN.exe": 1}

global leftWindowWidth := 0
global rightWindowWidth := 0

global MinttyID:=1
global preWindowID:=1
global showflag := 0

global flag:=1

;======================================================
; 在metty.exe下将原本的shift+insert复制快捷键改成ctrl+v
;=======================================================
<past>:
    send, +{Insert}
return 
init(){ 
    Hotkey, IfWinActive, ahk_class mintty
    Hotkey, ^+v, <past> 
}

;======================================================
; 在gvim.exe下将原本的shift+insert复制快捷键改成ctrl+v
;=======================================================
<gvim>:
	send, +{Insert}
return
gvimInit(){
	Hotkey, IfWinActive, ahk_exe gvim.exe
	Hotkey, ^+v, <gvim>
}

;======================================================
; 在vnote下有关热键, 使用执行热键时，需要加前缀空格
;=======================================================
;#IfWinActive ahk_exe VNote.exe
;	::img::<img width="500px" src=""/>{Left 3}{Esc}
;#IfWinActive

;======================================================
; 在Acrobat下有关热键
;=======================================================
#IfWinActive ahk_exe Acrobat.exe
	^m:: 
		send, ^h
		send, {F9}
	Return 
	!m:: 
		send, ^h
		send, {F9}
	Return 
	!p:: 
		send, ^+{F5}
	Return
#IfWinActive

;==========================================================
;the shortcut key to direction key and  switch windows
;==========================================================

~!~tab::
    flag:=0
Return

!h::
    if(flag==1){            
         Send,{Left}
    }else{
        #if,GetKeyState("alt")
        h::Left
        #if
    }
Return

!l::
    if(flag==1){
         Send,{Right}
    }else{
        #if,GetKeyState("alt")
        l::Right
        #if
    }
Return

!j::
    if(flag==1){
         Send,{Down}
    }else{
        #if,GetKeyState("alt")
        j::Down
        #if
    }
Return

!k::
    if(flag==1){
         Send,{Up}
    }else{
        #if,GetKeyState("alt")
        k::Up
        #if
    }
Return

~alt up::
    flag:=1
Return


!+j::
 Send {Down 3}
Return

!+k::
 Send {Up 3}
Return

!+l::
 Send {Right 3}
Return

!+h::
 Send {Left 3}
Return

!a::
 Send {End}
Return

!i::
 Send {Home}
Return

!u::
 Send {PgUp}
Return

!d::
 Send {PgDn}
Return

;=============================================================
;Set the delete and backspace shortcut
;=============================================================
!s::
    Send,{Delete}
Return

!q::
    Send,{Backspace}
Return

;==============================================================
;the shortcut key to select words
;==============================================================
!^+h::
    send,{ctrl down}{shift down}{left} 
Return

!^+l::
    send,{ctrl down}{shift down}{right} 
Return

;===========================================================================
;Set the 'metty.exe' to show and close automatically at the top
;===========================================================================

^+`::
    WinGet, id, ID, A
    preWindowID:=id
    Run, open-wsl.exe,,,PId
	WinWait, ahk_exe mintty.exe
    WinActivate, ahk_exe mintty.exe
    WinGet, active_id, ID, A
    MinttyID := active_id
    WinMove, ahk_id %active_id%,, -8, 0,1938,550
    WinSet, Style, -0xC00000, ahk_id %active_id%
    showflag := 1
Return

!`::
	WinGetPos,X,Y,W,H,ahk_id %MinttyID%
	WinHide, ahk_id %MinttyID%
	WinActivate, ahk_id %preWindowID%
	showflag := 0
Return

#Enter::
	if(showflag = 0){
        WinGet, id, ID,A
        preWindowID:=id
        WinShow, ahk_id %MinttyID%
        WinActivate, ahk_id %MinttyID%
        showflag := 1
		return
	}
	WinActivate, ahk_id %MinttyID%
Return

;===============================================================================
;用来修改win10默认的窗口快捷键，使左手可以单手操作
;===============================================================================
;按下ctrl + win + a等于按下ctrl + win +  左方向键
^#h::
    send, {lwin down}{ctrl down}{left}
return

;按下ctrl + win + l等于按下ctrl + win +  右方向键
^#l::
    send, {lwin down}{ctrl down}{right}
return

;按下win + m ，将窗口最大化，接下来的按键都是窗口缩放操作
#m::
    WinGet, id, ID, A
    WinGet, OutputVar, ProcessName, A
	WinGetPos,X,Y,W,H,ahk_id %id%
	if ( W<=1910 || H <= 1070){
		lastX[id] := X
		lastY[id] := Y
		lastW[id] := W
		lastH[id] := H
	}
	if(specialPro[OutputVar] = 1)
	{
		WinMove,ahk_id %id%,,0,0,1922, 1080
	}else{
		WinMove,ahk_id %id%,,-8,0, 1938, 1090
	}
	
return
 
#r::
    WinGet, id, ID, A
	WinMove,ahk_id %id%,,lastX[id],lastY[id],lastW[id], lastH[id]
return

#x::
    WinGet, id, ID, A
	WinRestore,ahk_id %id%
return

#k::
    WinGet, id, ID, A
    WinGet, OutputVar, ProcessName, A
	WinGetPos,X,Y,W,H,ahk_id %id%
	if(specialPro[OutputVar] = 1)
	{
		WinMove,ahk_id %id%,,%X%,0,%W%, 540
	}else{
		WinMove,ahk_id %id%,,%X%,0,%W%, 550
	}
return

#j::
    WinGet, id, ID, A
	WinGetPos,X,Y,W,H,ahk_id %id%
	WinMove,ahk_id %id%,,%X%,540,%W%, 540
return

;按下win + h ，将窗口向左移动
movetoLeft(OutputVar,OutputVar1){
	if(leftWindowWidth = 0){
		leftWindowWidth := 960
	}
	if(windows[OutputVar1] = 10){
		rightWindowWidth1 := leftWindowWidth+19
		WinMove,ahk_id %OutputVar1%,,-8,0,%rightWindowWidth1%,1087
	}else if(windows[OutputVar1] = 11){
		rightWindowWidth1 := leftWindowWidth+3
		WinMove,ahk_id %OutputVar1%,,0,0,%rightWindowWidth1%,1080
	}else{
		if(specialPro[OutputVar] = 1)
		{
			windows[OutputVar1] := 11
			rightWindowWidth1 := leftWindowWidth+3
			WinMove,ahk_id %OutputVar1%,,0,0,%rightWindowWidth1%,1080
		}else{
			windows[OutputVar1] := 10
			rightWindowWidth1 := leftWindowWidth+19
			WinMove,ahk_id %OutputVar1%,,-8,0,%rightWindowWidth1%,1087
		}
	}
}
#h::
    WinGet, OutputVar, ProcessName, A
    WinGet, OutputVar1, ID, A
	movetoLeft(OutputVar, OutputVar1)
return

!F4::
    WinGet, OutputVar1, ID, A
	windows.Delete(OutputVar1)
	WinClose, A
return

;按下win + l ，将窗口向右移动
; OutputVar: ProcessName
; OutputVar1: id
movetoRight(OutputVar, OutputVar1){
	if(leftWindowWidth = 0){
		leftWindowWidth := 960
	}
	rightWindowWidth := A_ScreenWidth - leftWindowWidth
	if(windows[OutputVar1] = 20){
		leftWindowWidth1 := leftWindowWidth - 6
		rightWindowWidth1 := rightWindowWidth + 16
		WinMove,ahk_id %OutputVar1%,,%leftWindowWidth1%,0,%rightWindowWidth1%,1087
	}else if(windows[OutputVar1] = 21){
		leftWindowWidth1 := leftWindowWidth + 2
		rightWindowWidth1 := rightWindowWidth - 2
		WinMove,ahk_id %OutputVar1%,,%leftWindowWidth1%,0,%rightWindowWidth1%,1080
	}else{
		if(specialPro[OutputVar] = 1)
		{
			windows[OutputVar1] := 21
			leftWindowWidth1 := leftWindowWidth + 2
			rightWindowWidth1 := rightWindowWidth - 2
			WinMove,ahk_id %OutputVar1%,,%leftWindowWidth1%,0,%rightWindowWidth1%,1080
		}
		else
		{
			windows[OutputVar1] := 20
			leftWindowWidth1 := leftWindowWidth - 6
			rightWindowWidth1 := rightWindowWidth + 16
			WinMove,ahk_id %OutputVar1%,,%leftWindowWidth1%,0,%rightWindowWidth1%,1087
		}
	}
}

#l::
    WinGet, OutputVar, ProcessName, A
    WinGet, OutputVar1, ID, A
	movetoRight(OutputVar,OutputVar1)
Return

;Swap left and right windows
#/::
	WinGetPos,X,Y,W,H,A
    WinGet, active_id_now, ID, A
    WinGet, OutputVar_now, ProcessName, A
	CoordMode, Mouse, Screen  ; 把光标移动是相对于屏幕坐标的位置.
	if(X>100){
		Click, 0, 0  ; 在指定坐标处点击鼠标左键.
		WinGet, active_id_other, ID, A
		WinGet, OutputVar_other, ProcessName, A
		movetoLeft(OutputVar_now, active_id_now)
		movetoRight(OutputVar_otehr, active_id_other)
	}
	else
	{
		Click, 1720,0   ; 在指定坐标处点击鼠标左键.
		WinGet, active_id_other, ID, A
		WinGet, OutputVar_other, ProcessName, A
		movetoRight(OutputVar_now, active_id_now)
		movetoLeft(OutputVar_otehr, active_id_other)
	}
	WinActivate, ahk_id %active_id_now%
Return

;按下win + n ，将窗口变小
#+m::
    WinGet, active_id, ID, A
	if(MinttyID = active_id){
		WinMove, ahk_id %active_id%,, 0, 0,1920,666
		windows.Delete(active_id)
	}else{
		WinGet, OutputVar, ProcessName, A
		WinMinimize, A
		WinActivate
	}
return

;=====================================================
; window manager
;=====================================================
;move the window'boundary left to change window size
+#h::
	WinGetPos,X,Y,W,H,A
	if(W < 1915){
		if(leftWindowWidth != 0){
			leftWindowWidth := leftWindowWidth - 175
			for key, value in windows{
				if(windows[key] = 10 || windows[key] = 11 ){
					WinGetPos,X,Y,W,H, ahk_id %key%
					W := W - 175
					WinMove,ahk_id %key%,,%X%,%Y%,%W%,%H%
				}else if(windows[key] = 20 || windows[key] = 21 ){
					WinGetPos,X,Y,W,H,ahk_id %key%
					X := X - 175
					W := W + 175
					WinMove,ahk_id %key%,,%X%,%Y%,%W%,%H%
				}
			}
		}
	}
Return

+#l::
	WinGetPos,X,Y,W,H,A
	if(W < 1915){
		if(leftWindowWidth != 0){
			leftWindowWidth := leftWindowWidth + 175
			For key, value in windows{
				if(windows[key] = 10 || windows[key] = 11 ){
					WinGetPos,X,Y,W,H,ahk_id %key%
					W := W + 175
					WinMove,ahk_id %key%,,%X%,%Y%,%W%,%H%
				}else if(windows[key] = 20 || windows[key] = 21 ){
					WinGetPos,X,Y,W,H,ahk_id %key%
					X := X + 175
					W := W - 175
					WinMove,ahk_id %key%,,%X%,%Y%,%W%,%H%
				}
			}
		}
	}
Return

#=::
	if(leftWindowWidth != 0){
		leftWindowWidth := 0
		for key, value in windows{
			if(windows[key] = 10 || windows[key] = 11 ){
				movetoLeft(0, key)
			}else if(windows[key] = 20 || windows[key] = 21 ){
				movetoRight(0, key)
			}
		}
	}
Return

;=====================================================
;Activate windows left,right, down and up.
;=====================================================
!1::
    CoordMode, Mouse, Screen
	Click, 40, 0
Return
#1::
    CoordMode, Mouse, Screen
	Click, 40, 0
Return
#,::
    CoordMode, Mouse, Screen
	Click, 40, 0
Return
!,::
    CoordMode, Mouse, Screen
	Click, 40, 0
Return

!2::
    CoordMode, Mouse, Screen
	Click, 1720,0
Return
#2::
    CoordMode, Mouse, Screen
	Click, 1720,0
Return
#.::
    CoordMode, Mouse, Screen
	Click, 1720,0
Return
!.::
    CoordMode, Mouse, Screen
	Click, 1720,0
Return

!3::
    CoordMode, Mouse, Screen
	Click, 0, 555
Return
#3::
    CoordMode, Mouse, Screen
	Click, 0, 555
Return

!4::
    CoordMode, Mouse, Screen
	Click, 1720, 555
Return
#4::
    CoordMode, Mouse, Screen
	Click, 1720, 555
Return

;=====================================================
;使有道云mini输入框得到焦点
;=====================================================
!^z::
	IfWinNotExist, ahk_class YdMiniModeWndClassName
	{
		Send ^!x
	}
	WinWait, ahk_class YdMiniModeWndClassName
    WinGetPos,X,Y,W,H,ahk_class YdMiniModeWndClassName
    X:=X+5
    Y:=Y+5
    CoordMode, Mouse, Screen  ; 把光标移动是相对于屏幕坐标的位置.
    MouseMove, %X%,%Y% ; 如果不将光标移动有道云mini窗口上的化，会导致无法输入 
    WinActivate, ahk_class YdMiniModeWndClassName
Return

;=====================================================
; Disable the win
;=====================================================
~LWin::Send {Bind}{vk07}
#`::
   Send {RWin} 
return


;=====================================================
; Wheel operation
;=====================================================
!e::MouseClick, WheelDown, , , 2  
!y::MouseClick, WheelUp, , , 2  

;=====================================================
; Open or use software quickly
;=====================================================
activate(t)
{
  IfWinExist, ahk_exe %t%
 {
    WinActivate, ahk_exe %t% 
    return 1
 }
  return 0
}

Open(t,p)
{
  if activate(t)==0
  {
	WinGetPos,X,Y,W,H,A
	WinGet, OutputVar2, ProcessName, A
	WinGet, OutputVar3, ID, A
	Run, %p%,,,PId
	WinWait, ahk_exe %t%
    WinActivate, ahk_exe %t%
    WinGet, OutputVar, ProcessName, A
    WinGet, OutputVar1, ID, A
	if(W>1915){
		movetoLeft(OutputVar2, OutputVar3)
	}
	movetoRight(OutputVar,OutputVar1)
    return
  }
}

#^c::Open("Code.exe","E:/vscode/Microsoft VS Code/code.exe") return
#^w::Open("WINWORD.EXE","C:/Program Files/Microsoft Office/root/Office16/WINWORD.EXE") return
#^t::Open("WINWORD.EXE","C:/Program Files/Microsoft Office/root/Office16/POWERPNT.EXE") return
#^g::Open("gvim.exe","E:/gvim/gvim.exe") return
#^p::Open("PotPlayerMini64.exe","E:/PotPlayer/PotPlayerMini64.exe") return
#^i::Open("idea64.exe","E:/idea/IntelliJ IDEA 2019.2.1/bin/idea64.exe") return
#^x::Open("Xshell.exe","E:/xmanager6.cn/Xshell 6/Xshell.exe") return
#^u::Open("Postman.exe","E:/Postman/Postman/app-7.1.1/Postman.exe") return
#^n::Open("VNote.exe","E:/VNote/VNote.exe") return
#^s::Open("webstorm64.exe","E:/webstrom/WebStorm 2019.2.3/bin/webstorm64.exe") return
#^o::Open("chrome.exe","C:/Program Files (x86)/Google/Chrome/Application/chrome.exe") return
#^f::Open("firefox.exe","E:/Mozilla Firefox/firefox.exe") return
#^y::Open("pycharm64.exe","E:/pycharm/pyCharm 2019.2.1/bin/pycharm64.exe") return
#^a::Open("studio64.exe","E:/android-studio/android-studio-ide-191/bin/studio64.exe") return
;#^r::Open("Typora.exe","E:/typora/Typora/Typora.exe") return


#c::activate("Code.exe") return
#w::activate("WINWORD.EXE") return
#t::activate("POWERPNT.EXE") return
#g::activate("gvim.exe") return
#p::activate("PotPlayerMini64.exe") return
#i::activate("idea64.exe") return
;#x::activate("Xshell.exe") return
#u::activate("Postman.exe") return
#n::activate("VNote.exe") return
#s::activate("webstorm64.exe") return
#o::activate("chrome.exe") return
#f::activate("firefox.exe") return
#y::activate("pycharm64.exe") return
#a::activate("studio64.exe") return
;#r::activate("Typora.exe") return
