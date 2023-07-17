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
		MouseMove, 740, 500
		Click
		Sleep, 1000
	}
return

; ---------------------------------- ;

BuyMax(col, row, category) {
    ElementsCol := [880, 1175]
	ElementsRow := [750, 870, 990]	
	
	; Indexing starts at 1 ?!?!?
	XPos := ElementsCol[col]
	YPos := ElementsRow[row]

    ResetCategory()

    if (category = "Offense")
        SwapToOffense()
    else if (category = "Defense")
        SwapToDefense()
    else 
        SwapToUtility()

	MouseMove, XPos, YPos
	Click
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
		MouseMove, 725, 1050
		Click
		Sleep, 1000
	}
}

SwapToDefense() {
	If WinActive("BlueStacks App Player") {
		MouseMove, 880, 1050
		Click
		Sleep, 1000	
	}
}

SwapToUtility() {
	If WinActive("BlueStacks App Player") {
		MouseMove, 1035, 1050
		Click
		Sleep, 1000
	}
}

SwapToUW() {
	If WinActive("BlueStacks App Player") {
		MouseMove, 1185, 1050
		Click
		Sleep, 1000
	}
}

ResetCategory() {
	If WinActive("BlueStacks App Player") {
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

EmployStrategy(Iteration) {
	If WinActive("BlueStacks App Player") {

        if (Iteration <= 20)
            ; Cash Bonus
            BuyMax(1, 1, "Utility")
        else if (21 < Iteration and Iteration <= 40)
            ; Cash / Wave
            BuyMax(1, 2, "Utility")
        else if (41 < Iteration and Iteration <= 60)
            ; Coin per Kill Bonus
            BuyMax(2, 1, "Utility")
        else if (61 < Iteration and Iteration <= 80)
            ; Coin / Wave
            BuyMax(2, 2, "Utility")
        else if (81 < Iteration and Iteration <= 100)
            ; Attack Speed
            BuyMax(1, 2, "Offense")
        else 
            ; Spam Health
            BuyMax(1, 1, "Defense")
	}
}

; ---------------------------------- ;

Main() {

	Sleep, 1000
	
	; Claims gems every 600 seconds (10 minutes) + margin of 5 seconds
	Gosub, Claimgems		
	SetTimer, ClaimGems, 605000

    global Iteration := 0

	Loop {
		If WinActive("BlueStacks App Player") {

            Iteration += 1

			; Employs hardcoded strategy
			EmployStrategy(Iteration)

			Sleep, 5000

		}
	}
}

; ---------------------------------- ;

; Starts/Exits the script when Backspace/Escape is pressed
Backspace::Main()
Esc::ExitApp


