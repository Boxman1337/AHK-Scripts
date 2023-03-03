; Zarp Automatic Drug Idler ;
; ------------------------- ;

Loop {
	If WinActive("Garry's Mod") {
	
		; Moves the mouse in-game as to create a swiping-effect
		MouseMove, 930, 540
		
		; Wait for a moment
		Sleep, 100
		
		; Try to open the window for the drug production unit
		Send {e}
		
		; Wait for a moment
		Sleep, 100
		
		; Click the drug to produce, closing the window
		click, 950, 540
	}
	
}

; Exits the macro if ESC is pressed
Esc::ExitApp
