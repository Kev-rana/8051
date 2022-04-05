;P1.0-P1.7 -> DB0-DB7
;P0.2->RS
;P0.1->R/W
;P0.0->E
ORG 0H
MOV A,#38H	;USE 2 LINES SCREEN OF LCD
ACALL CMDWRT
ACALL DELAY
MOV A,#0EH	;DISPLAY ON, CURSOR BLINK
ACALL CMDWRT
ACALL DELAY
MOV A,#01H	;CLEAR DISP SCREEN
ACALL CMDWRT
ACALL DELAY
MOV A,#06H	;SHIFT CURSOR RIGHT
ACALL CMDWRT
ACALL DELAY
MOV A,#84H	;MOVE CURSOR TO 5TH CURSOR POS, 4TH INDEX OF 1ST LINE
ACALL CMDWRT
ACALL DELAY

MOV A,#'K'
ACALL DATAWRT
ACALL DELAY
MOV A,#'E'
ACALL DATAWRT
ACALL DELAY
MOV A,#'V'
ACALL DATAWRT
ACALL DELAY

HLT:	SJMP HLT; STAY HERE
CMDWRT:	MOV P1,A
		CLR P0.2	;RS=0
		CLR P0.1	;R/W=0
		;CREATE A HIGH TO LOW TRIGGER
		SETB P0.0	;ENABLE HIGH
		CLR P0.0	;ENABLE LOW
		RET
DATAWRT:MOV P1,A
		SETB P0.2	;RS=0
		CLR P0.1	;R/W=0--WRITE
		;CREATE A HIGH TO LOW TRIGGER
		SETB P0.0	;ENABLE HIGH
		CLR P0.0	;ENABLE LOW
		RET
DELAY:	MOV R3,#0FFH
		MOV R4,#0FFH
		MOV R5,#55H
		HERE:	DJNZ R5,HERE
		HERE1:	DJNZ R4,HERE1
		HERE2:	DJNZ R3,HERE2
		RET
END
