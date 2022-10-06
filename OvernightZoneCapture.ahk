; Zarp Overnight Zone Capture ;
; --------------------------- ;

gosub ZoneCapture
SetTimer, ZoneCapture, 2050000
; Sleep for zone capture timer + cooldown timer + margin
; 14 min + 20 min + 10 sec = 2050000 ms

ZoneCapture:
	If WinActive("Garry's Mod") {
		Sleep, 1000
		Send {F4}
		Sleep, 1000
		MouseMove, 950, 815
		Sleep, 1000
		Click WheelDown	
		Click WheelDown
		Click WheelDown
		Sleep, 1000	
		Click
		Sleep, 1000
		MouseMove, 1300, 450
		Sleep, 1000
		Click
		Sleep, 1000
		MouseMove, 1380, 815
		Sleep, 1000
		Click
	}
return


Esc::ExitApp