; Zarp Overnight Zone Capture ;
; --------------------------- ;

; 950, 815
; 1300, 450
; 1380, 815

Loop {
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
		Sleep, 1000

		; Sleep for zone capture timer + cooldown timer + margin = 15 min + 20 min + 10 sec
		Sleep, 2110000	
	

	}
	
}

Esc::ExitApp