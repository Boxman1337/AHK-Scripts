; Zarp DJ Tool for better Timing / Precision ;
; ------------------------------------------ ;

; ------------- Each sample button and their respective X,Y - coordinate ------------- ;

Loop1_1 = [565, 360]
Loop1_2 = [565, 490]
Loop1_3 = [565, 620]
Loop1_4 = [565, 750]
Loop1_5 = [565, 880]

Loop2_1 = [735, 360]
Loop2_2 = [735, 490]
Loop2_3 = [735, 620]
Loop2_4 = [735, 750]
Loop2_5 = [735, 880]

Loop3_1 = [900, 360]
Loop3_2 = [900, 490]
Loop3_3 = [900, 620]
Loop3_4 = [900, 750]
Loop3_5 = [900, 880]

Loop4_1 = [1065, 360]
Loop4_2 = [1065, 490]
Loop4_3 = [1065, 620]
Loop4_4 = [1065, 750]
Loop4_5 = [1065, 880]

Loop5_1 = [1235, 360]
Loop5_2 = [1235, 490]
Loop5_3 = [1235, 620]
Loop5_4 = [1235, 750]
Loop5_5 = [1235, 880]

OneShot1_1 = [1400, 360]        ; Note 1; 
OneShot1_2 = [1400, 490]        ; Note 4 ;
OneShot1_3 = [1400, 620]        ; Cymbals ; 
OneShot1_4 = [1400, 750]        ; "Superstar" Voice Line / "Hey!" Voice Line / "Ryihaa" Voice Line ;
OneShot1_5 = [1400, 880]        ; Bomb / Firework ;

OneShot2_1 = [1525, 360]        ; Note 2 ;
OneShot2_2 = [1525, 490]        ; Note 5 ;
OneShot2_3 = [1525, 620]        ; "Na-na-na-na" Voice Line / Cowbell / Bass Drop ;
OneShot2_4 = [1525, 750]        ; Fart ;
OneShot2_5 = [1525, 880]        ; Devil Laugh ;

OneShot3_1 = [1650, 360]        ; Note 3 ; 
OneShot3_2 = [1650, 490]        ; Clap Sound / Guitar Rip Sound / Clap ;
OneShot3_3 = [1650, 620]        ; Something-something "Bottle" Voice Line / "Skrrrrrrr" Sound / "Slippers in the air" Voice Line ;
OneShot3_4 = [1650, 750]        ; Whistle ;
OneShot3_5 = [1650, 880]        ; Pirate Scream ;

; ------------- Record button coordinates ------------- ;
 
RecordButton = [340, 230]

; ------------- Functions ------------- ;

HitButton(array) {
    x := array[0]
    y := array[1]
    DllCall("SetCursorPos", "int", %x%, "int", %y%)
	Click
}

; ------------- Main Script Body ------------- ;

Sequence = [OneShot1_1, OneShot1_3]

Loop {
	If WinActive("Garry's Mod") {
		Sleep, 2000

        HitButton(OneShot1_1)
        
	}	
}

Esc::ExitApp
