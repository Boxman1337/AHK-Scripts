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
        ; Click the "claim gems" button
		MouseMove, 740, 500
		Click
		Sleep, 500
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
    SwapTo(category)
	MouseMove, XPos, YPos
	Click
	Sleep, 500
}

; ---------------------------------- ;

CenterMouseOnElements() {
	MouseMove, 960, 820
	Sleep, 500
}

; ---------------------------------- ;

SwapTo(category) {
    switch category {
        case "Offense": 
            MouseMove, 725, 1050
        case "Defense":
            MouseMove, 880, 1050
        case "Utility":
            MouseMove, 1035, 1050
        case "UW":
            MouseMove, 1185, 1050
    }
    Click
    Sleep, 500
}

ResetCategory() {
	If WinActive("BlueStacks App Player") {
		SwapTo("UW")
	}
}

; ---------------------------------- ;

ScrollToTop() {
	If WinActive("BlueStacks App Player") {
		CenterMouseOnElements()
		Loop, 10 {
		    Click WheelUp
        }
		Sleep, 500
	}

}

ScrollToBottom() {
	If WinActive("BlueStacks App Player") {
		CenterMouseOnElements()
        Loop, 10 {
		    Click WheelDown
        }
		Sleep, 500
	}
}

; ---------------------------------- ;

EmployStrategy(Iteration) {
	If WinActive("BlueStacks App Player") {

        if (Iteration <= 30)
            ; Coin per Kill Bonus
            BuyMax(1, 2, "Utility")
        else if (31 <= Iteration and Iteration <= 60)
            ; Coin / Wave
            BuyMax(2, 2, "Utility")
        else if (61 <= Iteration and Iteration <= 90)
            ; Damage
            BuyMax(1, 1, "Offense")
        else if (91 <= Iteration and Iteration <= 120)
            ; Crit Multi
            BuyMax(2, 2, "Offense")
        else 
            ; Spam Health
            BuyMax(1, 1, "Defense")
	}
}

; ---------------------------------- ;

Main() {

	Sleep, 1000
	
	; Tries to claim gems every 5 minutes
	Gosub, Claimgems		
	SetTimer, ClaimGems, 300000

    global Iteration := 0

	Loop {
		If WinActive("BlueStacks App Player") {

            Iteration += 1

			; Employs hardcoded strategy
			EmployStrategy(Iteration)

			Sleep, 4025

		}
	}
}

; ---------------------------------- ;

; Starts/Exits the script when Backspace/Escape is pressed
Backspace::Main()
Esc::ExitApp

; Pauses / Unpauses the script
p::Pause


