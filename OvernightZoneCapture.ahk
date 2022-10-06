; Zarp Overnight Zone Capture ;
; --------------------------- ;

SetTimer, ZoneCapture, 2050000
; Sleep for zone capture timer + cooldown timer + margin
; 14 min + 20 min + 10 sec = 2050000 ms

ZoneCapture:
	Sleep, 5000

	If WinActive("Garry's Mod") {
		Send {F4}
		Sleep, 1000
		MouseMove, 500, 350
		Sleep, 1000
		Click
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