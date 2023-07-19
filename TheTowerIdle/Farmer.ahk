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
	Sleep, 250
}

ClaimGems() {
	If WinActive("BlueStacks App Player") {	
        
        ; Click the "claim gems" button
		MouseMove, 740, 500
		Click
        Sleep, 250

        ; Press around the tower to collect the floating gems
        towerX := 960
        towerY := 310
        radius := 95

        angles := [0, 3.14/2, 3.14, 3*3.14/2]

        pointX := 0
        pointY := 0

        Loop % angles.Length() {
            pointX := Floor(towerX + radius * Sin(angles[A_Index]))
            pointY := Floor(towerY + radius * Cos(angles[A_Index]))

            MouseMove, pointX, pointY
            Click

            Sleep, 250
        }

        Sleep, 250

    }
}

TryRetry() {
    If WinActive("BlueStacks App Player") {
        MouseMove, 780, 820
        Click
        Sleep, 250
    }
}

; ---------------------------------- ;

CenterMouseOnElements() {
	MouseMove, 960, 820
	Sleep, 250
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
    Sleep, 250
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
		Sleep, 250
	}

}

ScrollToBottom() {
	If WinActive("BlueStacks App Player") {
		CenterMouseOnElements()
        Loop, 10 {
		    Click WheelDown
        }
		Sleep, 250
	}
}

; ---------------------------------- ;

EmployStrategy(Iteration) {
	If WinActive("BlueStacks App Player") {
        if (Mod(Iteration, 2) = 0)
            ; Spam Health
            BuyMax(1, 1, "Defense")
        else 
            ; Spam Damage
            BuyMax(1, 1, "Offense")
	}
}

; ---------------------------------- ;

Main() {

    Sleep, 2500

    global Iteration := 0

	Loop {
		If WinActive("BlueStacks App Player") {

            Iteration += 1

			; Employs hardcoded strategy
			EmployStrategy(Iteration)

            ClaimGems()

            TryRetry()

			Sleep, 3000

		}
	}
}

; ---------------------------------- ;

; Starts/Exits the script when Backspace/Escape is pressed
Backspace::Main()
Esc::ExitApp

; Pauses / Unpauses the script
p::Pause


