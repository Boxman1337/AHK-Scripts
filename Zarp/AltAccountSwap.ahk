; Zarp Dual Collector ;
; ------------------- ;

Loop {
	If WinActive("Garry's Mod") {
		
		ClickCollect()

		SetKeyDelay 30,50
		Send, {ALT DOWN}{TAB}{ALT UP}
		Sleep, 2000

		ClickCollect()

		Sleep, 30000
		
	}
	
}

ClickCollect()
{
	Click, 1300, 320
	Sleep, 2000
}

Esc::ExitApp

