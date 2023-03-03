; Zarp Automatic Song Like Incrementer ;
; ------------------------------------ ;

; Waits for a moment
Sleep 2000

; Activates the script
SetTimer, LikeSong, 60000

LikeSong:
    If WinActive("Garry's Mod") {

        ; Open F4 Menu
        SendInput, {F4 down}
        Sleep, 50
        SendInput, {F4 up}
		Sleep 500

        ; 620, 670 -- Club Studio F4 Button
        MouseMove, 620, 670
		Sleep 500
        Click

        ; 960, 740 -- Nightclub Queue Button
        MouseMove, 960, 740
		Sleep 500
        Click

        ; 1500, 790 -- Queue Song Button
        MouseMove, 1500, 790
		Sleep 500
        Click

        ; 750, 380 -- Vote Skip Current Song Button
        MouseMove, 750, 380
		Sleep 500
        Click

		; Like Song
		Sleep 2000
		SendInput, {F8 down}
        Sleep, 50
        SendInput, {F8 up}

	}

Esc::ExitApp
