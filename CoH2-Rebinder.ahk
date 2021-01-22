; Company of Heroes 2 Rebinder
; Version 1.2
; Scripted by Tamer

#CommentFlag //
#SingleInstance
IniFile=%A_WorkingDir%\rebinder.ini

defaultBinds =
(
; This is a file
[REBINDER]
F2=Send {Enter}Hey, what is the plan{?}{Enter}
F3=Send +{Enter}GL HF{!}{Enter}
w=up
a=left
s=down
d=right
m=Send {b}{m}
c=s
z=u
f=e
q=t
e=d
t=h
`=^a
)

loadBinds()

IfNotExist, %IniFile%
{
	FileAppend, %defaultBinds%, %IniFile%
	MsgBox, This is the first time you are using Rebinder, a new rebinder.ini file has been created. Using this file you can customize your hotkeys.
}

//#IfWinActive, Company Of Heroes 2
//{

	// Always disable capslock;
	SetCapsLockState, AlwaysOff

	// Keys used to suspend the script;
	~Enter::Suspend
	+~Enter::Suspend
	~NumpadEnter::Suspend
	+~NumpadEnter::Suspend
	NumpadSub::Suspend On
	~Esc::Suspend Off

	// Togle on/off behaviour;
	\::
	F1::
	Suspend
	if (A_IsSuspended) {
		//Overlay("disabled")
		SoundPlay, %A_WinDir%\Media\Speech Off.wav
		} else {
		//Overlay("enabled")
		SoundPlay, %A_WinDir%\Media\Speech On.wav
	}

	return

	

//}


loadBinds()
{
	global
	IniRead, hotkeys, %IniFile%, REBINDER
	Loop, Parse, hotkeys,`n,`r
	{
		StringSplit, key, A_LoopField, =, %A_Space%%A_Tab%
		Hotkey, %key1%, %key2%
		//MsgBox, Mapping %key1% to %key2%
	}
}

// Custom code to show a nice overlay in game;
// Update: This does not work anymore in the x64 version of CoH2;
Overlay(action)
{
	global
	Gui MyRebinder: New
	Gui MyRebinder: +LastFound -Caption +ToolWindow +AlwaysOnTop
	Gui MyRebinder: Font, s24, Arial q4
	Gui MyRebinder: Color, 000000
	if (action = "enabled")
	{
	    Gui MyRebinder: Add, Text, x30 y15 vStatus cLime, REBINDER ENABLED!
	}
	else if (action = "disabled")
	{
	    Gui MyRebinder: Add, Text, x30 y15 vStatus cRed, REBINDER DISABLED!
	}
	Gui MyRebinder: Font, s12 Arial q4 bold
	Gui MyRebinder: Add, Text, x30 y50 vCredits cAqua, SCRIPTED BY TAMER
	WinSet, TransColor, 000000 255
	Gui MyRebinder: Show, x0 y400 NoActivate, MyRebinder
	// Some fancy code to show the GUI async, because it does not work with sleep;
	SetTimer, AsyncCloseOverlay, 2000
	return
	AsyncCloseOverlay:
	Gui MyRebinder: Destroy
	SetTimer, AsyncCloseOverlay, Off
	return
	return
}
