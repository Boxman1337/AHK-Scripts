#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Element1 - 880, 750
; Element2 - 1175, 750
; Element3 - 880, 870
; Element4 - 1175, 870
; Element5 - 880, 990
; Element6 - 1175, 990

; ---------------------------------- ;

ClaimGems:
	If WinActive("BlueStacks App Player") {
		; Click the "claim gems" button and sleep for .25 seconds
		Click, 740, 500
		Sleep, 1000
	}
return

; ---------------------------------- ;

BuyMax(col, row) {

	ElementsCol := [880, 1175]
	ElementsRow := [750, 870, 990]
	
	Click, ElementsCol[%col% - 1], ElementsRow[%row% - 1]
	
	Sleep, 1000
}

; ---------------------------------- ;

CenterMouseOnElements() {
	MouseMove, 960, 820
	Sleep, 1000
}

; ---------------------------------- ;

SwapToOffense() {
	If WinActive("BlueStacks App Player") {
		Click, 725, 1050
		Sleep, 1000
	}
}

SwapToDefense() {
	If WinActive("BlueStacks App Player") {
		Click, 880, 1050
		Sleep, 1000	
	}
}

SwapToUtility() {
	If WinActive("BlueStacks App Player") {
		Click, 1035, 1050
		Sleep, 1000
	}
}

SwapToUW() {
	If WinActive("BlueStacks App Player") {
		Click, 1185, 1050
		Sleep, 1000
	}
}

ResetCategory() {
	If WinActive("BlueStacks App Player") {
		SwapToUW()
		SwapToOffense()
		SwapToUW()
	}
}

; ---------------------------------- ;

ScrollToTop() {
	If WinActive("BlueStacks App Player") {
		
		CenterMouseOnElements()

		Click WheelUp
		Click WheelUp
		Click WheelUp
		Click WheelUp
		Click WheelUp
		Click WheelUp

		Sleep, 1000
	}
}

ScrollToBottom() {
	If WinActive("BlueStacks App Player") {

		CenterMouseOnElements()

		Click WheelDown
		Click WheelDown
		Click WheelDown
		Click WheelDown
		Click WheelDown
		Click WheelDown

		Sleep, 1000
	}
}

; ---------------------------------- ;

EmployStrategy() {
	If WinActive("BlueStacks App Player") {

		; At the beginning of the first 30 iterations, swap to the utility category and try to max a cash income
		ScrollToTop()
		ResetCategory()
		SwapToUtility()
		
		; Cash Bonus
		BuyMax(1, 1)

		; Cash / Wave
		BuyMax(2, 1)
		
	}
}

; ---------------------------------- ;

Main() {

	Sleep, 1000
	
	If WinActive("BlueStacks App Player") {
		; Claims gems every 600 seconds (10 minutes) + margin of 5 seconds
		SetTimer, ClaimGems, 605000
	}

	Loop {
		If WinActive("BlueStacks App Player") {
	
			; Move mouse to center among elements
			CenterMouseOnElements()

			; Employs hardcoded strategy
			EmployStrategy()

			Sleep, 5000

		}
	}
}

; ---------------------------------- ;

; Starts/Exits the script when Backspace/Escape is pressed
Backspace::Main()
Esc::ExitApp


