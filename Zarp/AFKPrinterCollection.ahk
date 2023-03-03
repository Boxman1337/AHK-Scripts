; Zarp Collector Printers Only ;
; ---------------------------- ;

Loop {
	If WinActive("Garry's Mod") {
	
		; Clicks the button responsible for collecting money
		click, 1300, 320
		
		; Waits the amount of time for the uranium production unit to recharge
		Sleep, 540000
	}
	
}

; Exits the macro if ESC is pressed
Esc::ExitApp
