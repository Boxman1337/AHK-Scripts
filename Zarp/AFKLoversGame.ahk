
; Waits for a moment 
Sleep, 2000

; Activates the script every 16 seconds
SetTimer, LoversGame, 16000

LoversGame:
    If WinActive("Garry's Mod") {
        
        ; Start Round
        Click, 970, 1020
        Sleep, 3000

        ; Bottom Left
        Click, 840, 860
        Sleep, 500

        ; Bottom Right
        Click, 1070, 860
        Sleep, 500

        ; Mid Left
        Click, 840, 660
        Sleep, 500

        ; Mid Right
        Click, 1070, 660
        Sleep, 500

        ; Top Left
        Click, 840, 460
        Sleep, 500

        ; Top Right
        Click, 1070, 460
        Sleep, 500
    }

; Exits the macro if ESC is pressed
Esc::ExitApp
