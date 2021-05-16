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

global flag:=1

global MinttyID:=1
global preWindowID:=1
global showflag := 0

global specialPro := {"Code.exe": 1, "wps.exe": 1,"PotPlayerMini64.exe": 1}
global windows :={}
global leftWindowWidth := 0
global rightWindowWidth := 0

; ========
; ======== Disable the win key
; ========
~LWin::Send {Bind}{vkE8}
#`::
 Send {RWin}
return

; ========
; ======== the shortcut key to direction key and  switch windows
; ========
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

; ========
; ======== Set the 'windowTerminal.exe' to show and close automatically at the top
; ========
^+`::
  WinGet, id, ID, A
  preWindowID:=id
  Run, wt.exe,,,PId
	WinWait, ahk_exe WindowsTerminal.exe
  WinActivate, ahk_exe WindowsTerminal.exe
  WinGet, active_id, ID, A
  MinttyID := active_id
  WinMove, ahk_id %active_id%,, -8, 0,1938,600
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

; ========
; ======== window operation
; ========
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
	WinMove,ahk_id %id%,,%X%,540,%W%, 547
return

#h::
  WinGet, OutputVar, ProcessName, A
  WinGet, OutputVar1, ID, A
	movetoLeft(OutputVar, OutputVar1)
return

#l::
  WinGet, OutputVar, ProcessName, A
  WinGet, OutputVar1, ID, A
	movetoRight(OutputVar,OutputVar1)
Return

#m::
  WinGet, id, ID, A
  WinGet, OutputVar, ProcessName, A
	if(specialPro[OutputVar] = 1)
	{
		WinMove,ahk_id %id%,,0,0,1922, 1079
	}else{
		WinMove,ahk_id %id%,,-8,0, 1938, 1087
	}
return

#x::
    WinGet, id, ID, A
	WinRestore,ahk_id %id%
return

; ========
; ======== Activate windows left,right, down and up.
; ========
#,::
  CoordMode, Mouse, Screen
	Click, 40, 0
Return

#.::
  CoordMode, Mouse, Screen
	Click, 1720,0
Return

#;::
  CoordMode, Mouse, Screen
	Click, 0, 555
Return

#'::
  CoordMode, Mouse, Screen
	Click, 1720, 555
Return

; ========
; ======== other programs activate
; ========
activate(t)
{
  IfWinExist, ahk_exe %t%
 {
    WinActivate, ahk_exe %t% 
    return 1
 }
  return 0
}

#c::activate("Code.exe") return
#o::activate("chrome.exe") return
#p::activate("PotPlayerMini64.exe") return
#i::activate("idea64.exe") return
#e::activate("Explorer.exe") return
#w::activate("webstorm64.exe") return
