; Zarp Dual Collector ;
; ------------------- ;

; Start loop on Uranium account, ALT+TAB to other collector
Backspace::StartLoop()

StartLoop()
{

	Sleep, 1000

	Loop {
		If WinActive("Garry's Mod") {
		
			; Collect Uranium
			ClickCollect()
			
			; Alt-Tab to second collector
			AltTab()

			; Collect from second collector
			ClickCollect()

			; Alt-Tab to Uranium
			AltTab()

			; Close Uranium Collector
			ExitCollect()

			; Initiate Uranium-processing
			ProcessUranium()

			; Open Uranium Collector again
			Send {e}
			
			Sleep, 600000
		
		}
	
	}
}

ClickCollect()
{
	Click, 1300, 320
	Sleep, 2000
}

ExitCollect()
{
	Click 1420, 290
	Sleep, 2000
}

AltTab()
{
	SetKeyDelay 30,50
	Send, {ALT DOWN}{TAB}{ALT UP}
	Sleep, 2000
}

ProcessUranium()
{	
	; Open F4 Menu
	Send {F4}
	Sleep, 1000

	; Click Actions Tab
	Click, 850, 290
	Sleep, 1000

	; Click Uranium Processor
	Click, 840, 670
	Sleep, 1000

	; Click Add Uranium
	Click, 700, 790
	Sleep, 1000

	; Drag Amount-Slider
	Click, 1015, 535
	Sleep, 1000

	; Click Confirm
	Click, 960, 560
	Sleep, 1000

	; Process Uranium
	Click, 1060, 790
	Sleep, 1000

	; Press Continue
	Click, 960, 630
	Sleep, 1000

	; Close F4
	Send {F4}
	Sleep, 1000
}

Esc::ExitApp

