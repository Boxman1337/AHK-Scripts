; Zarp Overnight Zone Capture ;
; --------------------------- ;

SetTimer, ZoneCapture, 2227500
; Sleep for zone capture timer + cooldown timer + margin
; 15 min + 22 min + 10 sec = 2227500 ms

ZoneCapture:
	Sleep, 5000

	If WinActive("Garry's Mod") {
		Send {F4}
		Sleep, 1500

		MouseMove, 500, 350
		Sleep, 1500

		Click
		MouseMove, 950, 815
		Sleep, 1500

		Click WheelDown	
		Click WheelDown
		Click WheelDown
		Sleep, 1500	

		Click
		Sleep, 1500

		MouseMove, 1300, 350
		Sleep, 1500
		Click
		Sleep, 1500

		MouseMove, 1380, 815
		Sleep, 1500
		Click
	}
return


Esc::ExitApp