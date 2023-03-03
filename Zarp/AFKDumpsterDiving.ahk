; Zarp Overnight Dumpster Diving ;
; ------------------------------ ;

Loop {
	If WinActive("Garry's Mod") {
	
		; Interacts with the dumpster
		Send {e}
		
		; Wait for a moment
		Sleep, 10500
	}
	
}

; Exits the macro if ESC is pressed
Esc::ExitApp
