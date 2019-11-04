; Company of Heroes 2 Rebinder
; Scripted by Tamerciaga
; https://github.com/tamerciaga/coh2-rebinder

#IfWinActive, Company Of Heroes 2
{
#CommentFlag //
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
	Overlay("disabled")
	} else {
	Overlay("enabled")
}
SoundPlay, %A_WinDir%\Media\chimes.wav
return

// Some keys to send messages;
F2::Send {Enter}Hey, what is the plan{?}{Enter}
F3::Send +{Enter}GL HF{!}{Enter}

// Rebind arrow keys to WASD;
w::up
a::left
s::down
d::right

// Additional rebinds here;
//g::g
//r::r
m::Send {b}{m}
c::s
z::u
f::e
q::t
t::h
`::^a
}

// Custom code to show a nice overlay in game;
Overlay(action)
{
	global
	Gui MyRebinder: New
	Gui MyRebinder: +LastFound +AlwaysOnTop -Caption +ToolWindow
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
	Gui MyRebinder: Add, Text, x30 y50 vCredits cAqua, SCRIPTED BY TAMERCIAGA
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
